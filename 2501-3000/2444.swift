class Solution {
  func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int64 {
    var res: Int64 = 0
    var bad = -1, left = -1, right = -1

    for i in 0..<nums.count {
        if nums[i] < minK || nums[i] > maxK { bad = i }
        if nums[i] == minK { left = i }
        if nums[i] == maxK { right = i }
        res += Int64(max(0, min(left, right) - bad))
    }

    return res
}
}
