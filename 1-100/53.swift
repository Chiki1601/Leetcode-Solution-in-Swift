class Solution {
     func maxSubArray(_ nums: [Int]) -> Int {
        var max = nums[0]
        var sum = 0
        var i = 0
        
        while i < nums.count {
            let num = nums[i]
            sum += num
            
            if sum > 0 {
                max = max > sum ? max : sum
            } else {
                max = max > num ? max : num
                sum = 0
            }
            
            i += 1
        }
        
        return max
    }
    
}
