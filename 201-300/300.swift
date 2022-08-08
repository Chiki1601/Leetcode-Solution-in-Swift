class Solution {
     func lengthOfLIS(_ nums: [Int]) -> Int {
      guard nums.count > 0 else { return 0 }
      let m = nums.count
      var longestSubSequenceCounts = Array(repeating: 1, count: m)
    
      for i in 0..<m {
          for j in 0..<i where nums[j] < nums[i] {
              longestSubSequenceCounts[i] =
                  max(longestSubSequenceCounts[j] + 1, longestSubSequenceCounts[i])
          }
      }
      
      return longestSubSequenceCounts.max()!
  }
}
