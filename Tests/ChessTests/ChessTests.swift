import XCTest
@testable import Chess

final class ChessTests: XCTestCase {
    
    func testSquareEquals() {
        XCTAssertEqual(Square.a1, .init(file: .a, rank: 1))
        XCTAssertNotEqual(Square.a1, .b1)
        XCTAssertNotEqual(Square.a1, .b2)
    }
    
    func testAscii() {
        let board = Board()
        let ascii = board.ascii()
        print(ascii)
        XCTAssertEqual(ascii.count(of: "p", ignoreCase: true), 16)
        XCTAssertEqual(ascii.count(of: "q", ignoreCase: true), 2)
        XCTAssertEqual(ascii.count(of: "k", ignoreCase: true), 2)
    }
    
    func testFEN() {
        XCTAssertEqual(Board().fen(), "pppppppp/rnbqkbnr/8/8/8/8/RNBQKBNR/PPPPPPPP")
    }

    static var allTests = [
        ("testSquareEquals", testSquareEquals),
        ("testAscii", testAscii),
        ("testFEN", testFEN),
    ]
}

extension String {
    func count(of stringToFind: String, ignoreCase: Bool = false) -> Int {
        func ignoringCaseIfNeeded(string: String) -> String {
            guard ignoreCase else { return string }
            return string.lowercased()
        }
        
        let haystack = ignoringCaseIfNeeded(string: self)
        let needle = ignoringCaseIfNeeded(string: stringToFind)
        
        return haystack.components(separatedBy: needle).count - 1
    }
}

