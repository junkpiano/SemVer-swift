import Foundation

/// A struct representing a SemVer version.
struct SemVer {
    let major: Int
    let minor: Int
    let patch: Int
    let preRelease: String?
}

// MARK: - Initializers

extension SemVer {

    public init(_ versionString: String) {
        var comps = versionString.components(separatedBy: ".")
        while comps.count < 3 {
            comps.append("0")
        }

        self.major = Int(comps[0]) ?? 0
        self.minor = Int(comps[1]) ?? 0

        let patchComponents = comps[2].components(separatedBy: "-")
        self.patch = Int(patchComponents[0]) ?? 0
        if patchComponents.count == 1 {
            self.preRelease = nil
        } else {
            self.preRelease = String(patchComponents[1])
        }
    }

}

// MARK: - Comparable

extension SemVer: Comparable {

    static func == (lhs: SemVer, rhs: SemVer) -> Bool {
        return lhs.major == rhs.major && lhs.minor == rhs.minor
            && lhs.patch == rhs.patch && lhs.preRelease == rhs.preRelease
    }

    static func < (lhs: SemVer, rhs: SemVer) -> Bool {
        if lhs.major < rhs.major {
            return true
        }

        if lhs.minor < rhs.minor {
            return true
        }

        if lhs.patch < rhs.patch {
            return true
        }
        
        if let lhsPreRelease = lhs.preRelease, let rhsPreRelease = rhs.preRelease {
            return lhsPreRelease < rhsPreRelease
        } else {
            return rhs.preRelease == nil
        }
    }

    static func > (lhs: SemVer, rhs: SemVer) -> Bool {
        if lhs.major > rhs.major {
            return true
        }

        if lhs.minor > rhs.minor {
            return true
        }

        if lhs.patch > rhs.patch {
            return true
        }
        
        if let lhsPreRelease = lhs.preRelease, let rhsPreRelease = rhs.preRelease {
            return lhsPreRelease > rhsPreRelease
        } else {
            return lhs.preRelease == nil
        }
    }

}
