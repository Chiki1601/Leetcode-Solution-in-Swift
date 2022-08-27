class Solution {
      
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var j = 1
        var count = 1
        
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                count += 1
            } else {
                count = 1
            }
            
            if count <= 2 {
                nums[j] = nums[i]
                j += 1
            }
        }
        
        return j
    }

}
