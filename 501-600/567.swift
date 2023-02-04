class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count { return false }
        let c1 = s1.count, c2 = s2.count, s = Array(s2)
        var dict = s1.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] - 1 })
        func updateDict(_ char: Character, _ inc: Int) {
            let v = dict[char, default: 0] + inc
            dict[char] = v == 0 ? nil : v
        }
        for i in 0..<c1 {
            updateDict(s[i], 1)
        }
        if dict.isEmpty { return true }
        var i = c1
        while i < c2 {
            updateDict(s[i - c1], -1)
            updateDict(s[i], 1)
            i += 1
            if dict.isEmpty { return true }
        }
        return false
    }
}
