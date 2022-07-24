class Solution {
     func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<nums.count { res.insert(nums[i], at: index[i]) }
        return res
    }
    
}
