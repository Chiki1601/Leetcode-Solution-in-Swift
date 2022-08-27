class Solution {
  
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        var newNums = [Int]()
        newNums.append(1)
        for i in 0..<n { newNums.append(nums[i]) }
        newNums.append(1)
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
        return maxCoins(&dp, newNums, 0, n + 1)
    }
    

    private func maxCoins(_ dp: inout [[Int]], _ nums: [Int], _ left: Int, _ right: Int) -> Int {
        guard left + 1 != right else { return 0 }
        guard dp[left][right] == 0 else { return dp[left][right] }
        var ans = 0
        
        for i in (left + 1)..<right {
            let L = maxCoins(&dp, nums, left, i)
            let R = maxCoins(&dp, nums, i, right)
            ans = max(ans, nums[left] * nums[i] * nums[right] + L + R)
        }
        
        dp[left][right] = ans
        return ans
    }

}
