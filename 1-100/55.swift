class Solution {
     func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        var i = 0

        while i <= reach {
            reach = max(reach, i + nums[i])
            i += 1
            if reach >= nums.count - 1 { return true }
        }

        return false
    }

}
