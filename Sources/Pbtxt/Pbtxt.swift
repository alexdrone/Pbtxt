import Foundation

public struct Pbtxt {
  
  public static func parse(pbtxt: String) -> [String: Any] {
    let lines = pbtxt.components(separatedBy: .newlines)
    // Tokenize the file.
    var tokens: [Token] = []
    for line in lines {
      var chars = Array(line)
      tokens.append(contentsOf: Pbtxt._tokenize(chars: &chars))
    }
    var dict: Pbtxt.Object = [:]
    _parse(tokens: &tokens, object: &dict)
    var result: [String: Any] = [:]
    _merge(input: dict, output: &result)
    return result
  }
  
  public static func write(dictionary: [String: Any]) -> String {
    var pbtxt = ""
    _write(buffer: &pbtxt, dictionary: dictionary)
    return pbtxt
  }
  
  static func decode<T>(
    type: T.Type,
    pbtxt: String,
    decoder: JSONDecoder = JSONDecoder()
  ) throws -> T where T : Decodable {
    let dict = parse(pbtxt: pbtxt)
    let json = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    return try decoder.decode(type, from: json)
  }
  
  static func encode<T>(
    object: T,
    encoder: JSONEncoder = JSONEncoder()
  ) throws -> String where T : Encodable {
    let jsonRaw = try encoder.encode(object)
    let jsonDict = try JSONSerialization.jsonObject(with: jsonRaw, options: []) as? [String: Any]
    return write(dictionary: jsonDict ?? [:])
  }
  
  // MARK: - Internal (Parsing)
  
  /// Represents the a key in the protobuf.
  public typealias Key = String
  /// A map between protobuf text keys are the allowed values.
  public typealias Object = [Key: [Rhs]]

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
    case object(fields: Pbtxt.Object)
    /// A malformed rhs.
    case error

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
    var objectValue: Pbtxt.Object? {
      if case .object(let object) = self { return object }
      return nil
    }
  }
  
  static func _merge(input: Pbtxt.Object, output: inout [String: Any]) {
    for (key, values) in input {
      var outputValues: [Any] = []
      for value in values {
        // The value is an object.
        if let object = value.objectValue {
          var dict: [String: Any] = [:]
          _merge(input: object, output: &dict)
          outputValues.append(dict)
        // The value is a scalar value.
        } else if let scalar = value.scalarValue {
          outputValues.append(scalar)
        }
      }
      let key_repeated = "\(key)_repeated"
      output[key_repeated] = outputValues
      output[key] = outputValues.first
    }
  }
  
  static func _parse(tokens: inout [Token], object: inout Pbtxt.Object) {
    var lhs: Bool = true
    var key: String = ""
    while !tokens.isEmpty {
      let token = tokens.removeFirst()
      if lhs {
        lhs.toggle()
        switch token {
        case .primitive(let rawValue):
          key = rawValue
          if object[key] == nil { object[key] = [] }
        // Pop nested object context.
        case .end: return
        default:
          fatalError("lhs expected (key).")
        }
      // rhs.
      } else {
        lhs.toggle()
        switch token {
        // Rhs terminal.
        case .primitive(let rawValue):
          object[key]?.append(_parseRhsPrimitive(rawValue))
        // Nested object (recursive call).
        case .begin:
          var dict: Pbtxt.Object = [:]
          _parse(tokens: &tokens, object: &dict)
          object[key]?.append(.object(fields: dict))
        default:
          fatalError("rhs expected.")
        }
      }
    }
  }
  
  static func _parseRhsPrimitive(_ rawValue: String) -> Pbtxt.Rhs {
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
    return .error
  }
  
  // MARK: - Tokenizer
  
  enum Token: CustomStringConvertible {
    /// A token representing a key.
    case primitive(raw: String)
    /// An open bracket.
    case begin
    /// A closed bracket.
    case end
  
    /// Returns the raw value if this is a `token` type, `nil` otherwise.
    var rawValue: String? {
      if case .primitive(let raw) = self { return raw }
      return nil
    }
    /// Whether this token represent an open bracket `{`.
    var isBeginBlock: Bool {
      if case .begin = self { return true }
      return false
    }
    /// Whether this token represent a closed bracket `}`.
    var isEndBlock: Bool {
      if case .end = self { return true }
      return false
    }
    /// A textual representation of this instance.
    var description: String {
      switch self {
      case .primitive(let string): return "\(string)"
      case .begin: return "{"
      case .end: return "}"
      }
    }
  }
  
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
      if char == ":" { break }
      if char == "{" { delimiter = .begin; break }
      if char == "}" { delimiter = .end; break }
      // Valid character to be added to the match.
      match.append(char)
    }

    if !match.isEmpty {
      currentTokens.append(.primitive(raw: String(match)))
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
    // Compute the indentation level.
    let indentString = (0...indent).reduce("") { result, _ in result + "  " }
    
    // Get all of the keys (if `_repeated` keys are available, pick those).
    let keys = dictionary.keys.filter {
      return !dictionary.keys.contains("\($0)_repeated")
    }
    for key in keys {
      // Get the key value.
      let fields: [Any] = dictionary[key] as? [Any] ?? [dictionary[key]!]
      
      // Treats all of the fiels as repeated.
      for field in fields {
        // Write the key in the buffer.
        let writeableKey = key.replacingOccurrences(of: "_repeated", with: "")
        buffer += "\n\(indentString)\(writeableKey): "
        
        // Nested object.
        if let object = field as? [String: Any] {
          buffer += "{"
          _write(buffer: &buffer, dictionary: object, indent: indent + 1)
          buffer += "\n\(indentString)}"

        // Scalar value.
        } else if let number = field as? NSNumber {
          buffer += "\(number)"
        } else if let string = field as? String {
          buffer += "\"\(string)\""
        }
      }
    }
  }
}
