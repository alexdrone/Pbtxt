# Pbtxt [![Swift](https://img.shields.io/badge/swift-5.1-orange.svg?style=flat)](#) 

Schemaless protobuf text parsers.

### `Pbtxt.parse(pbtxt: String) throws -> [String: Any]`:

Parse a protobuf text-format file into a dictionary.
Since the parser is unaware of the schema, there are 2 keys being decoded for every field:
- `key`: non-repeated field version.
- `Pbtxt.repeatedField(key)`: repeated field version (where the associated value is an array).

*Example* Given the *pbtxt* below:
```pbtxt
executor {
  num_threads: 2
  [some.proto.ext]: "__"
}
model { id: "node_1" }
model { id: "node_2" }
```
 The parsed dictionary yields:
 ``` swift
let dict = try Pbtxt.parse(pbtxt: src)
dict["executor"] // {num_threads: 2, ..}
dict["model"] // {id: "node_1"}
dict[Pbtxt.repeatedField("model")] // [{id: "node_1"}, {id: "node_2"}]
```

### `Pbtxt.decode<T>(type: T.Type,pbtxt: String) throws -> T where T : Decodable `:

Returns a value of the type you specify, decoded from a *pbtxt* file.
Since the parser is unaware of the schema, the same consideration about repeated/non-repeated fields described above applies and 
must be reflected in your object `CodingKeys`.

An example codable object for the above described *pbxt* would be the following;

```swift
 struct Executor: Codable {
   enum CodingKeys: String, CodingKey {
      case numThreads = "process"
      case ext = "[some.proto.ext]"
   }
   let numThreads: UInt
   let ext: String
 }

 struct Model: Codable {
   let id: String
 }

 struct Obj: Codable {
   enum CodingKeys: String, CodingKey {
     case executor = "executor"
     case models = Pbtxt.repeatedField("model")
   }
   let executor: Executor
   let models: [Model]
 }
 ```


### `Pbtxt.write(dictionary: [String: Any]) -> String `:

Write a dictionary into protobuf text-format.

 ### `Pbtxt.encode<T>(object: T) -> T where T : Decodable `:

Encodes an object into its protobuf text-format representation.
