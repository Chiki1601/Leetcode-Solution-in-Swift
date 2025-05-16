class Solution {
    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let n = words.count
        let w = words.map { Array($0.utf8) }
        var dp = [(len: Int, prev: Int)](repeating: (1, -1), count: n)
        for i in 1..<n { 
            for j in 0..<i {
                if groups[i] != groups[j] && ham(i, j) == 1 && dp[i].len <= dp[j].len {
                    dp[i] = (dp[j].len + 1, j)
                }
            }
        }
        var idx = dp.enumerated().max(by: { $0.element.len < $1.element.len })!.offset
        var ans = [String]()
        while idx != -1 {
            ans.append(words[idx])
            idx = dp[idx].prev
        }
        return ans.reversed()

        func ham(_ i: Int, _ j: Int) -> Int {
            let (s, t) = (w[i], w[j])
            if s.count != t.count { return .max }
            return s.indices.count { s[$0] != t[$0] }
        }
    }
}
