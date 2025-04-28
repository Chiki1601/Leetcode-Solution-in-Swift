class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var result = 0
        var windowSum = 0
        var right = 0
        
        for left in 0..<n {
            while right < n && (windowSum + nums[right]) * (right - left + 1) < k {
                windowSum += nums[right]
                right += 1
            }
            result += right - left
            windowSum -= nums[left]
        }
        return result        
    }
}
