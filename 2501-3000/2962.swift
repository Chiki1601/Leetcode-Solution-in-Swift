class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var left = 0
        var remaining = k
        let maxValue = nums.max()
        
        for num in nums {
            if num == maxValue {
                remaining -= 1
            }
            while remaining == 0 {
                if nums[left] == maxValue {
                    remaining += 1
                }
                left += 1
            }
            result += left
        }
        return result        
    }
}
