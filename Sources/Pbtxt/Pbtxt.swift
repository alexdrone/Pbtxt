import Foundation

public struct Pbtxt {
  
  public enum Error: Swift.Error {
    /// There was an error while parsing the protobuf text.
    case unableToParsePbtxt(message: String)
  }
  
  /// Parse a protobuf text-format file into a dictionary.
  /// Since the parser is unaware of the schema, there are 2 keys being decoded for every field:
  /// - `key`: non-repeated field version.
  /// - `Pbtxt.repeatedField(key)`: repeated field version (where the associated value is an array).
  ///
  /// *Example* Given the *pbtxt* below:
  /// ```
  /// executor {
  ///   num_threads: 2
  ///   [some.proto.ext]: "__"
  /// }
  /// model { id: "node_1" }
  /// model { id: "node_2" }
  /// ```
  /// The parsed dictionary yields:
  /// ```
  /// let dict = try Pbtxt.parse(pbtxt: src)
  /// dict["executor"] // {num_threads: 2, ..}
  /// dict["model"] // {id: "node_1"}
  /// dict[Pbtxt.repeatedField("model")] // [{id: "node_1"}, {id: "node_2"}]
  /// ```
  public static func parse(pbtxt: String) throws -> [String: Any]  {
    let lines = pbtxt.components(separatedBy: .newlines)
    // Tokenize the file.
    var tokens: [Token] = []
    for line in lines {
      var chars = Array(line)
      tokens.append(contentsOf: Pbtxt._tokenize(chars: &chars))
    }
    var dict: Pbtxt.Message = [:]
    try _parse(tokens: &tokens, message: &dict)
    var result: [String: Any] = [:]
    _merge(message: dict, output: &result)
    return result
  }
  
  /// Write a dictionary into protobuf text-format.
  public static func write(dictionary: [String: Any]) -> String {
    var pbtxt = ""
    _write(buffer: &pbtxt, dictionary: dictionary)
    return pbtxt
  }

  // MARK: - Codable
  
  /// Returns a value of the type you specify, decoded from a *pbtxt* file.
  /// - parameter type: The type of the value to decode from the supplied JSON object.
  /// - parameter pbtxt: The protobuf text format file to decode.
  ///
  /// Since the parser is unaware of the schema, there are 2 keys being decoded for every field:
  /// - `key`: non-repeated field version.
  /// - `Pbtxt.repeatedField(key)`: repeated field version (where the associated value is an array).
  /// Match the desired field type in your `CondingKeys`
  ///
  /// *Example* Given the *pbtxt* below:
  /// ```
  /// executor {
  ///   num_threads: 2
  ///   [some.proto.ext]: "__"
  /// }
  /// model { id: "node_1" }
  /// model { id: "node_2" }
  /// ```
  ///
  /// A matching model would be:
  /// ```
  /// struct Executor: Codable {
  ///   enum CodingKeys: String, CodingKey {
  ///      case numThreads = "process"
  ///      case ext = "[some.proto.ext]"
  ///   }
  ///   let numThreads: UInt
  ///   let ext: String
  /// }
  ///
  /// struct Model: Codable {
  ///   let id: String
  /// }
  ///
  /// struct Obj: Codable {
  ///   enum CodingKeys: String, CodingKey {
  ///     case executor = "executor"
  ///     case models = Pbtxt.repeatedField("model")
  ///   }
  ///   let executor: Executor
  ///   let models: [Model]
  /// }
  /// ```
  ///
  static func decode<T>(
    type: T.Type,
    pbtxt: String,
    decoder: JSONDecoder = JSONDecoder()
  ) throws -> T where T : Decodable {
    let dict = try parse(pbtxt: pbtxt)
    let json = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    return try decoder.decode(type, from: json)
  }
  
  /// Encodes an object into its protobuf text-format representation.
  static func encode<T>(
    object: T,
    encoder: JSONEncoder = JSONEncoder()
  ) throws -> String where T : Encodable {
    let jsonRaw = try encoder.encode(object)
    let jsonDict = try JSONSerialization.jsonObject(with: jsonRaw, options: []) as? [String: Any]
    return write(dictionary: jsonDict ?? [:])
  }
  
  // MARK: - Const
  
  public static let repeatedFieldSuffix: String = "*"
    
  /// Returns the *repeated* version for the key passed as argument.
  public static func repeatedField(_ key: String) -> String {
    key.contains(Pbtxt.repeatedFieldSuffix) ? key : "\(key)\(Pbtxt.repeatedFieldSuffix)"
  }
  
  // MARK: - Internal (Parsing)
  
  /// A map between protobuf text keys are the allowed values.
  public typealias Message = [String: [Rhs]]

  /// All of the possible rhs expression for a protobuf text values.
  ///  - todo: Support homogeneous arrays such as  `key: [1, 2.4, 3]`
  public enum Rhs {
    /// A terminal node with a string value (e.g. `key: "bin"`).
    case string(value: String)
    /// A terminal node with an integer value (e.g. `key: -12`, `key: 0xF`, `key: 3.1415`).
    case number(value: Double)
    /// A terminal node with a boolean value (e.g. `key: true`, `key: false`).
    case boolean(value: Bool)
    /// A nested object value. (e.g. `key { foo: 2 }`)
    case message(fields: Pbtxt.Message)
    /// An array of scalars.
    case array(elements: [RhsScalarValue])
    /// Returns this rhs as a scalar value (if applicable).
    var scalarValue: Any? {
      switch self {
      case .string(let value): return value
      case .number(let value): return value
      case .boolean(let value): return value
      default: return nil
      }
    }
    /// Returns this rhs as an object (if applicable).
    var messageValue: Pbtxt.Message? {
      if case .message(let object) = self { return object }
      return nil
    }
    /// Returns this rhs as a array of primitives.
    var arrayValue: [RhsScalarValue]? {
      if case .array(let elements) = self { return elements }
      return nil
    }
  }
  
  @inline(__always)
  static func _parse(tokens: inout [Token], message: inout Pbtxt.Message) throws {
    // Whether we are currently evaluating a left-hand side expr (lhs) or a right-hand one.
    var lhs: Bool = true
    // If we already parse a lhs-expr we should have a key.
    var key: String = ""
    
    // Consume all tokens.
    while !tokens.isEmpty {
      let token = tokens.removeFirst()
      // Skips optional assignment tokens.
      if case .assignment = token { continue }
    
      if lhs {
        lhs.toggle()
        
        switch token {
        // lhs-terminal (key).
        case .scalar(let rawValue):
          key = rawValue
          if message[key] == nil { message[key] = [] }
          
        // Pop nested object context.
        case .messageEnd: return
        default:
          throw Pbtxt.Error.unableToParsePbtxt(message: "lhs-expr expected.")
        }
      // rhs.
      } else {
        assert(!key.isEmpty)
        lhs.toggle()

        switch token {
        // rhs-terminal (scalar).
        case .scalar(let rawValue):
          message[key]?.append(try _parseRhsScalar(rawValue))
          
        // Push nested message context.
        case .messageBegin:
          var buffer: Pbtxt.Message = [:]
          try _parse(tokens: &tokens, message: &buffer)
          message[key]?.append(.message(fields: buffer))
          
        // Parse array of primitives.
        case .arrayBegin:
          message[key]?.append(try _parseRhsArray(tokens: &tokens))
          
        default:
          throw Pbtxt.Error.unableToParsePbtxt(message: "rhs-expr expected.")
        }
      }
    }
  }
  
  static func _parseRhsArray(tokens: inout [Token]) throws -> Pbtxt.Rhs {
    var array: [RhsScalarValue] = []
    while !tokens.isEmpty {
      let token = tokens.removeFirst()
      switch token {
      // rhs-terminal (scalar).
      case .scalar(let rawValue):
        guard let value = try _parseRhsScalar(rawValue).scalarValue as? RhsScalarValue else {
          continue
        }
        array.append(value)
      // Skip separator.
      case .arraySeparator: continue
      // Pop the array context.
      case .arrayEnd: return .array(elements: array)
      default: break
      }
    }
    throw Pbtxt.Error.unableToParsePbtxt(message: "invalid token in array context.")
  }
  
  @inline(__always)
  static func _parseRhsScalar(_ rawValue: String) throws -> Pbtxt.Rhs {
    // The terminal is a double quoted string.
    var char = "\""
    if rawValue.hasPrefix(char) {
      return .string(value: rawValue.replacingOccurrences(of: char, with: ""))
    }
    // Hex number (e.g. `0x0000001`).
    char = "0x"
    if rawValue.hasPrefix(char) {
      let hexString = rawValue.replacingOccurrences(of: char, with: "")
      guard let number = UInt(hexString, radix: 16) else { return .number(value: 0) }
      return .number(value: Double(number))
    }
    // Base-10 number (e.g. `0`, `-3.14`).
    if let number = Double(rawValue) {
      return .number(value: number)
    }
    // Booleans (`true`, `false`).
    if rawValue == "true" { return .boolean(value: true) }
    if rawValue == "false" { return .boolean(value: false) }
    // An enum value.
    if rawValue.rangeOfCharacter(from: .whitespacesAndNewlines) != nil {
      return .string(value: rawValue)
    }

    throw Pbtxt.Error.unableToParsePbtxt(message: "unexpected rhs-terminal: \(rawValue)")
  }
  
  @inline(__always)
  static func _merge(message: Pbtxt.Message, output: inout [String: Any]) {
    for (key, fields) in message {
      var outputValues: [Any] = []
      for field in fields {
        // The field is a nested object.
        if let object = field.messageValue {
          var buffer: [String: Any] = [:]
          _merge(message: object, output: &buffer)
          outputValues.append(buffer)
          continue
        }
        // The field is a array of primitives.
        if let array = field.arrayValue {
          outputValues.append(array)
          continue
        }
        // The field is a scalar value.
        if let scalar = field.scalarValue {
          outputValues.append(scalar)
        }
      }
      output[repeatedField(key)] = outputValues
      output[key] = outputValues.first
    }
  }
  
  // MARK: - Tokenizer
  
  enum Token: CustomStringConvertible {
    /// A token representing a key.
    case scalar(raw: String)
    /// lhs assignment token (optional).
    case assignment
    /// An open bracket (begin message context).
    case messageBegin
    /// A closed bracket (end message context).
    case messageEnd
    /// An open squared bracket.
    case arrayBegin
    /// An closed squared bracket.
    case arrayEnd
    /// Array elements separator.
    case arraySeparator
    
    /// Returns the raw value if this is a `token` type, `nil` otherwise.
    var rawValue: String? {
      if case .scalar(let raw) = self { return raw }
      return nil
    }
    /// A textual representation of this instance.
    var description: String {
      switch self {
      case .scalar(let string): return "\(string)"
      case .assignment: return ":"
      case .messageBegin: return "{"
      case .messageEnd: return "}"
      case .arrayBegin: return "["
      case .arrayEnd: return "]"
      case .arraySeparator: return ","
      }
    }
  }
    
  @inline(__always)
  static func _tokenize(chars: inout [Character], tokens: [Token] = []) -> [Token] {
    var currentTokens = tokens
    var match: [Character] = []
    var delimiter: Token?
    var isMatchingDoubleQuotedString = false
    var isMatchingComment = false

    while !chars.isEmpty {
      let char: Character = chars.removeFirst()
      assert(char.isASCII, "asciipb support only.")
  
      // Matching a `"..."` string.
      // TODO: Support escaping.
      if isMatchingDoubleQuotedString {
        match.append(char)
        if char == "\"" { break }
        continue
      }
      
      // Begin matching a `"..."` string.
      if char == "\"" {
        match.append(char)
        isMatchingDoubleQuotedString = true
        continue
      }
      
      // Skip whitespaces.
      if char.isWhitespace { continue }
      if char == "#" { isMatchingComment = true; break }
      if char == ":" { delimiter = .assignment; break }
      if char == "{" { delimiter = .messageBegin; break }
      if char == "}" { delimiter = .messageEnd; break }
      if char == "," { delimiter = .arraySeparator; break }
      
      // Matching array (e.g. a `key: [1, 2, 3]`) begins.
      if char == "[", let token = currentTokens.last, case .assignment = token {
        delimiter = .arrayBegin
        break
      }
      // End array.
      if char == "]", let token = currentTokens.last, ["[", ","].contains(token.description) {
        delimiter = .arrayEnd
        break
      }
      // Valid character to be added to the match.
      match.append(char)
    }

    if !match.isEmpty {
      currentTokens.append(.scalar(raw: String(match)))
    }
    if let delimiter = delimiter {
      currentTokens.append(delimiter)
    }
    // We consumed the whole string.
    if chars.isEmpty || isMatchingComment {
      return currentTokens
    }
    // ...otherwise we continue to tokenization.
    return _tokenize(chars: &chars, tokens: currentTokens)
  }
  
  // MARK: - Internal (Writing)
  
  static func _write(buffer: inout String, dictionary: [String: Any], indent: UInt = 0) {
    let pre = (0...indent).reduce("") { result, _ in result + "  " }
    
    // Get all of the keys (if `_repeated` keys are available, pick those).
    let keys = dictionary.keys.filter {
      return $0.hasSuffix(Pbtxt.repeatedFieldSuffix) || !dictionary.keys.contains(repeatedField($0))
    }
    for key in keys {
      // Wrap all of the fields as repeated.
      let fields: [Any] = dictionary[key] as? [Any] ?? [dictionary[key]!]
      for field in fields {
        // Write the key in the buffer.
        let writeableKey = key.replacingOccurrences(of: Pbtxt.repeatedFieldSuffix, with: "")
        buffer += "\n\(pre)\(writeableKey): "

        // Nested message.
        if let object = field as? [String: Any] {
          buffer += "{"
          _write(buffer: &buffer, dictionary: object, indent: indent + 1)
          buffer += "\n\(pre)}"
          continue
        }
        
        // Scalar values.
        if let number = field as? NSNumber {
          buffer += "\(number)"
          continue
        } else if let string = field as? String {
          buffer += "\"\(string)\""
        }
      }
    }
  }
  
  static private func _printTokens(_ tokens: [Token]) {
    print(tokens.map { $0.description }.joined(separator: "•"))
  }
}

// MARK: RhsScalarValue

public protocol RhsScalarValue {
  // Marker for all of the scalar terminals in a pbtxt.
}

extension String: RhsScalarValue {
  // Match with double quoted strings in a pbtxt.
}

extension Double: RhsScalarValue {
  // Match with a number in a pbtxt.
}

extension Bool: RhsScalarValue {
  // Match with a boolean litteral in a pbtxt.
}
