class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var nums = nums  // Create a mutable copy
        var count = 0
        let n = nums.count

        for i in 0..<n-2 {
            if nums[i] == 0 {
                nums[i] ^= 1
                nums[i + 1] ^= 1
                nums[i + 2] ^= 1
                count += 1
            }
        }

        return (nums[n - 2] == 1 && nums[n - 1] == 1) ? count : -1
    }
}
