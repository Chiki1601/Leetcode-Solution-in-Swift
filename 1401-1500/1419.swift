class Solution {
    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        var croak = Croak()
        var croakingFrogsCount = 0
        var frogsCount = 0
        
        for c in croakOfFrogs {
            if !croak.addAndCheckValid(with: c) { return -1 }
            if c == "c" { croakingFrogsCount += 1 }
            if c == "k" { croakingFrogsCount -= 1 }
            frogsCount = max(frogsCount, croakingFrogsCount)
        }
        
        return croakingFrogsCount == 0 && croak.isCountEqualed() ? frogsCount : -1
    }
    

    class Croak {
        var c = 0
        var r = 0
        var o = 0
        var a = 0
        var k = 0
        
        func addAndCheckValid(with character: Character) -> Bool {
            switch character {
            case "c": c += 1
            case "r": r += 1
            case "o": o += 1
            case "a": a += 1
            case "k": k += 1
            default: break
            }
            return isCountValid()
        }
        
        func isCountValid() -> Bool { (c >= r) && (r >= o) && (o >= a) && (a >= k) }
        func isCountEqualed() -> Bool { (c == r) && (c == o) && (c == a) && (c == k) }
    }
}
