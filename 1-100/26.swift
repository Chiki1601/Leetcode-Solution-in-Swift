class Solution {
      func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var i = 0

        for j in 1..<nums.count {
            guard nums[i] != nums[j] else { continue }
            i += 1
            nums[i] = nums[j]
        }
        return i + 1
    }
}
