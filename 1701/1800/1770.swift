class Solution {

    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let m = nums.count
        let n = multipliers.count
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: n + 1), count: n + 1)


        func dfs(_ l: Int, _ r: Int, _ i: Int) -> Int {
            guard i < n else { return 0 }
            if let score = memo[i][l] { return score }
            memo[i][l] = max(nums[l] * multipliers[i] + dfs(l + 1, r, i + 1), nums[r] * multipliers[i] + dfs(l, r - 1, i + 1))
            return memo[i][l] ?? 0
        }
        return dfs(0, m - 1, 0)
    }

}
