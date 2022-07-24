class Solution {
   
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let total = nums.reduce(0) { $0 + $1 }
        var ans = [Int]()
        var preSum = 0
        let n = nums.count

        for idx in 0..<n {
            ans.append((2 * idx - n) * nums[idx] - 2 * preSum  + total)
            preSum += nums[idx]
        }
        return ans
    }
}
