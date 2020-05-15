# Pbtxt [![Swift](https://img.shields.io/badge/swift-5.1-orange.svg?style=flat)](#) 

Schemaless protobuf text parsers.

#### `Pbtxt.parse(pbtxt: String) throws -> [String: Any]`:

Parse a protobuf text-format file into a dictionary.
Since the parser is unaware of the schema, there are 2 keys being decoded for every field:
- `key`: non-repeated field version.
- `Pbtxt.repeatedField(key)`: repeated field version (where the associated value is an array).

*Example* Given the *pbtxt* below:
```pbtxt
layer {
  dim: 42
  [some.proto.ext]: "__"
}
model { id: "id_1" }
model { id: "id_2" }
```
 The parsed dictionary yields:
 ``` swift
let dict = try Pbtxt.parse(pbtxt: src)
dict["layer"] // {dim: 42, ..}
dict["model"] // {id: "node_1"}
dict[Pbtxt.repeatedField("model")] // [{id: "id_1"}, {id: "id_2"}]
```

#### `Pbtxt.decode<T: Decodable>(type: T.Type,pbtxt: String) throws -> T`:

Returns a value of the type you specify, decoded from a *pbtxt* file.
Since the parser is unaware of the schema, the same consideration about repeated/non-repeated fields described above applies and 
must be reflected in your object `CodingKeys`.

An example codable object for the above described *pbxt* would be the following;

```swift
 struct Layer: Codable {
   enum CodingKeys: String, CodingKey {
      case dimension = "dim"
      case ext = "[some.proto.ext]"
   }
   let dimension: UInt
   let ext: String
 }

 struct Model: Codable {
   let id: String
 }

 struct Obj: Codable {
   enum CodingKeys: String, CodingKey {
     case layer = "layer"
     case models = Pbtxt.repeatedField("model")
   }
   let layer: Layer
   let models: [Model]
 }
 ```


#### `Pbtxt.write(dictionary: [String: Any]) -> String `:

Write a dictionary into protobuf text-format.

#### `Pbtxt.encode<T: Encodable>(object: T) -> T`:

Encodes an object into its protobuf text-format representation.
