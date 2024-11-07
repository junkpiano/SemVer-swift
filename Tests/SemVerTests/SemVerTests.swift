import Testing
@testable import SemVer

final class SemVerTests {

    @Test
    func testExample() throws {
        let semVer1Alpha = SemVer(major: 1, minor: 1, patch: 0, preRelease: "alpha.1")
        let semVer1 = SemVer(major: 1, minor: 1, patch: 0, preRelease: nil)
        let semVer2 = SemVer(major: 1, minor: 1, patch: 0, preRelease: "alpha.2")
        let semVer3 = SemVer("1")
        let semVer4 = SemVer("1")
        let semVer5 = SemVer("0.3.2")

        #expect(semVer1Alpha < semVer2)
        #expect(semVer1Alpha < semVer1)
        #expect(semVer1Alpha > semVer3)
        #expect(semVer3 == semVer4)
        #expect(semVer5 < semVer4)
        #expect(semVer5 < semVer3)
    }
}
