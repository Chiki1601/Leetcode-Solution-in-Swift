class Solution {
       func wiggleSort(_ nums: inout [Int]) {
        var sortNums = nums.sorted()
        var k = (nums.count + 1) / 2 - 1
        var j = nums.count - 1
        
        for i in 0..<nums.count {
            if i & 1  == 1 {
                nums[i] = sortNums[j]
                j -= 1
            } else {
                nums[i] = sortNums[k]
                k -= 1
            }
        }
    }
}
