class Solution {
      func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var left = 0, right = 0
        var maxQueue: [Int] = [], minQueue: [Int] = [], ans = 0
        
        while right < nums.count {
            while !minQueue.isEmpty && nums[right] < nums[minQueue.last!] { minQueue.removeLast() }
            minQueue.append(right)
            
            while !maxQueue.isEmpty && nums[right] > nums[maxQueue.last!] { maxQueue.removeLast() }
            maxQueue.append(right)

            while nums[maxQueue.first!] - nums[minQueue.first!] > limit {
                if right == maxQueue.first! {
                    left = minQueue.removeFirst() + 1
                } else if right == minQueue.first! {
                    left = maxQueue.removeFirst() + 1
                }
            }

            ans = max(ans, right - left + 1)
            right += 1
        }
        
        return ans
    }
}
