import XCTest
@testable import Pbtxt

final class PbtxtTests: XCTestCase {
  
    func testTokenization() {
      var array = Array("key: 12")
      var tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 2)
      XCTAssert(tokens[0].rawValue == "key")
      XCTAssert(tokens[1].rawValue == "12")
      
      array = Array(" [media.some.ext] : -0xFF {")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 3)
      XCTAssert(tokens[0].rawValue == "[media.some.ext]")
      XCTAssert(tokens[1].rawValue == "-0xFF")
      XCTAssert(tokens[2].isBeginBlock)

      array = Array("{key_Foo: -12.34}")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 4)
      XCTAssert(tokens[0].isBeginBlock)
      XCTAssert(tokens[1].rawValue == "key_Foo")
      XCTAssert(tokens[2].rawValue == "-12.34")
      XCTAssert(tokens[3].isEndBlock)
      
      array = Array("{ { { -0.0001: :: some")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 5)
      XCTAssert(tokens[0].isBeginBlock)
      XCTAssert(tokens[1].isBeginBlock)
      XCTAssert(tokens[2].isBeginBlock)
      XCTAssert(tokens[3].rawValue == "-0.0001")
      XCTAssert(tokens[4].rawValue == "some")

      array = Array("key: \"some string foo\"")
      tokens = Pbtxt._tokenize(chars: &array)
      XCTAssert(tokens.count == 2)
      XCTAssert(tokens[0].rawValue == "key")
      XCTAssert(tokens[1].rawValue == "\"some string foo\"")
    }
  
  func testDecode() {
    struct Result1: Codable {
      struct Executor: Codable { let num_threads: Int }
      struct Options: Codable { let ctx: String; let max_overrun: UInt }
      struct Node: Codable {
        enum CodingKeys: String, CodingKey { case process = "process", options = "[options]" }
        let process: String;
        let options: Options
      }
      
      let executor: Executor
      let node_repeated: [Node]
    }
    var pbtxt = """
    executor {  num_threads: 2 }
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
    let result1 = try! Pbtxt.decode(type: Result1.self, pbtxt: pbtxt)
    XCTAssert(result1.executor.num_threads == 2)
    XCTAssert(result1.node_repeated[0].process == "scale")
    XCTAssert(result1.node_repeated[1].process == "translate")
  }

}
