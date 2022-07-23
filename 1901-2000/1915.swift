class Solution {
    func wonderfulSubstrings(_ word: String) -> Int {
        var mask = 0
        var finded = 0
        var maskCache = Array(repeating: 0, count: 1024)
        let ascii_a = Character("a").asciiValue!
        
        maskCache[0] = 1

        for c in word {
            mask ^= 1<<Int(c.asciiValue! - ascii_a)
            finded += maskCache[mask]
            for i in 0..<10 { finded += maskCache[mask ^ (1<<i)] }
            maskCache[mask] += 1
        }
        return finded
    }
}
