class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let arraySum = nums.reduce(0, +)
        if arraySum % 2 != 0 { return false }
        let target = arraySum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        
        for num in nums {
            for i in stride(from: target, through: num, by: -1) {
                dp[i] = dp[i] || dp[i - num]
                if dp[target] { break }
            }
        }
        return dp[target]        
    }
}
