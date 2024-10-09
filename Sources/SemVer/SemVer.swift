import Foundation

struct SemVer {
    let major: Int
    let minor: Int
    let patch: Int
}

extension SemVer {
    init(_ versionString: String) {
        var comps = versionString.components(separatedBy: ".")
        while(comps.count < 3) {
            comps.append("0")
        }
        
        self.major = Int(comps[0]) ?? 0
        self.minor = Int(comps[1]) ?? 0
        self.patch = Int(comps[2]) ?? 0
    }
}

extension SemVer: Comparable {

    static func == (lhs: SemVer, rhs: SemVer) -> Bool {
        return lhs.major == rhs.major &&
               lhs.minor == rhs.minor &&
               lhs.patch == rhs.patch
    }

    static func < (lhs: SemVer, rhs: SemVer) -> Bool {
        if(lhs.major < rhs.major) {
            return true
        }
        
        if(lhs.minor < rhs.minor) {
            return true
        }
        
        if(lhs.patch < rhs.patch) {
            return true
        }
        
        return false
    }
    
    static func > (lhs: SemVer, rhs: SemVer) -> Bool {
        if(lhs.major > rhs.major) {
            return true
        }
        
        if(lhs.minor > rhs.minor) {
            return true
        }
        
        if(lhs.patch > rhs.patch) {
            return true
        }
        
        return false
    }

}
