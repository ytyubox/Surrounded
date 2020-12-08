//
//  SurroundedCoreTests.swift
//  SurroundedCoreTests
//
//  Created by 游宗諭 on 2020/12/8.
//

import XCTest
import SurroundedCore
class Worker {
    var intent = "    "
    fileprivate func inputBlock(_ placeholder: String) -> String {
        return ["<","#", placeholder, "#", ">"].joined()
    }
    
    func surround(placeholder: String = "Group", _ code: String) -> String {
        let p = inputBlock(placeholder)
        
        let output =  """
            \(p) {
            \(intent)\(code)
            }
            """
        return output
    }
}
class SurroundedCoreTests: XCTestCase {

    func testSingleLineCanBeSurroundByInputBlockWith1Intent() {
        let code = """
        Text("123")
        """
        let sut = Worker()
        let expect = """
        <#Group#> {
            Text("123")
        }
        """
        XCTAssertEqual(sut.surround(code), expect)
    }

}
