class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()

        for c in s { dict[c, default: 0] += 1 }

        for (i, c) in s.enumerated() {
            guard dict[c] == 1 else { continue }
            return i
        }

        return -1
    }
}
