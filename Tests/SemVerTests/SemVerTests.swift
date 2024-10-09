import XCTest
@testable import SemVer

final class SemVerTests: XCTestCase {
    func testExample() throws {
        let semVer1 = SemVer(major: 1, minor: 1, patch: 0)
        let semVer2 = SemVer(major: 1, minor: 1, patch: 1)
        let semVer3 = SemVer("1")
        let semVer4 = SemVer("1")
        let semVer5 = SemVer("0.3.2")
        XCTAssertTrue(semVer1 < semVer2)
        XCTAssertFalse(semVer1 < semVer3)
        XCTAssertEqual(semVer3, semVer4)
        XCTAssertTrue(semVer4 > semVer5)
    }
}
