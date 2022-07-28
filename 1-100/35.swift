class Solution {
      func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count

        while start < end {
            let mid = start + (end - start) / 2

            if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return start
    }

}
