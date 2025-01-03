class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        let totalSum = nums.reduce(0, +)
        var result = 0
        var leftSum = 0
        for i in 0 ..< nums.count - 1 {
            leftSum += nums[i]
            if leftSum >= totalSum - leftSum {
                result += 1
            }
        }

        return result
    }
}
