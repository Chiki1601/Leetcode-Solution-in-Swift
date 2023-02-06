class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var firstPtr = 0
        var secondPtr = n
        var result:[Int] = []
        
        while firstPtr != n && secondPtr != 2*n {
            result.append(nums[firstPtr])
            result.append(nums[secondPtr])
            
            firstPtr+=1
            secondPtr+=1
        }
        
        return result
    }
}
