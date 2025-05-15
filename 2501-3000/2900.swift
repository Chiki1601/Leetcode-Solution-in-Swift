class Solution {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let n = groups.count
        var ans = [words[0]]
        for i in 1..<n {
            if groups[i] != groups[i-1] {
                ans.append(words[i])
            }
        }
        return ans
    }
}
