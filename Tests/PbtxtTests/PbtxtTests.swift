import XCTest
@testable import Pbtxt

final class PbtxtTests: XCTestCase {
  
    func testTokenization() {
      
      var array = Array("key: 12")
      var tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 3)
      XCTAssert(tokens[0].rawValue == "key")
      XCTAssert(tokens[2].rawValue == "12")
      
      array = Array(" [media.some.ext] : -0xFF {")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 4)
      XCTAssert(tokens[0].rawValue == "[media.some.ext]")
      XCTAssert(tokens[2].rawValue == "-0xFF")
      XCTAssert(tokens[3].description == "{")

      array = Array("{key_Foo: -12.34}")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 5)
      XCTAssert(tokens[0].description == "{")
      XCTAssert(tokens[1].rawValue == "key_Foo")
      XCTAssert(tokens[3].rawValue == "-12.34")
      XCTAssert(tokens[4].description == "}")
      
      array = Array("{ { { -0.0001: :: some")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 8)
      XCTAssert(tokens[0].description == "{")
      XCTAssert(tokens[1].description == "{")
      XCTAssert(tokens[2].description == "{")
      XCTAssert(tokens[3].rawValue == "-0.0001")
      XCTAssert(tokens[7].rawValue == "some")

      array = Array("key: \"some string foo\"")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 3)
      XCTAssert(tokens[0].rawValue == "key")
      XCTAssert(tokens[2].rawValue == "\"some string foo\"")
      
      array = Array("array: [1,2,3, 4] [not_an_array]: 2")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 14)
      XCTAssert(tokens[0].rawValue == "array")

    }
  
  func testDecode() {
    struct Executor: Codable {
      let num_threads: Int
      let array_1: [UInt]
    }
    struct Options: Codable {
      let ctx: String;
      let max_overrun: UInt
    }
    struct Node: Codable {
       enum CodingKeys: String, CodingKey { case process = "process", options = "[options]" }
       let process: String;
       let options: Options
     }

    struct Result: Codable {
      enum CodingKeys: String, CodingKey { case executor = "executor", nodes = "node*" } // *: repeated-field suffix.
      let executor: Executor
      let nodes: [Node]
    }
    let pbtxt = """
    executor {
      num_threads: 2
      array_1: [1,2,3]
    }
    node {
      process: "scale"
      [options] {
        ctx: "ctx1"
        max_overrun: 0x00001
      }
    }
    node {
      process: "translate"
      [options] {
        ctx: "ctx2"
        max_overrun: 2
      }
    }
    """
    let result1 = try! Pbtxt.decode(type: Result.self, pbtxt: pbtxt)
    XCTAssert(result1.executor.num_threads == 2)
    XCTAssert(result1.nodes[0].process == "scale")
    XCTAssert(result1.nodes[1].process == "translate")
    // Test decode.
    print(try! Pbtxt.encode(object: result1))
  }

}
