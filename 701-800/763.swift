class Solution {
    
    func partitionLabels(_ S: String) -> [Int] {
        var dict = [Character: Int]()
        var j = 0
        var anchor = 0
        var ans = [Int]()

        for (i, ch) in S.enumerated() { dict[ch] = i }

        for (i, ch) in S.enumerated() {
            j = max(j, dict[ch] ?? -1)
            guard i == j else { continue }
            ans.append(i - anchor + 1)
            anchor = i + 1
        }

        return ans
    }
}
