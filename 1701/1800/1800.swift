class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        let c = nums.count
        var result = nums[0], sum = result
        for i in 1..<c {
            if nums[i] > nums[i - 1] {
                sum += nums[i]
            } else {
                sum = nums[i]
            }
            result = max(result, sum)
        }
        return result
    }
}
