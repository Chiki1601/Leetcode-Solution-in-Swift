class Solution {
     func movesToMakeZigzag(_ nums: [Int]) -> Int {
        var res = [Int].init(repeating: 0, count: 2)
        var left = 0, right = 0

        for i in 0..<nums.count {
            left = i > 0 ? nums[i - 1] : 1001
            right = i + 1 < nums.count ? nums[i + 1] : 1001
            res[i % 2] += max(0, nums[i] - min(left, right) + 1)
        }

        return min(res[0], res[1])
    }
}
