class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var ans: Int = 0
        var j = -1
        var prevMinKIndex = -1
        var prevMaxKIndex = -1
        
        for i in 0..<nums.count {
            if nums[i] < minK || nums[i] > maxK {
                j = i
            }
            if nums[i] == minK {
                prevMinKIndex = i
            }
            if nums[i] == maxK {
                prevMaxKIndex = i
            }
            
            ans += Int(max(0, min(prevMinKIndex, prevMaxKIndex) - j))
        }
        
        return Int(ans)
    }
}
