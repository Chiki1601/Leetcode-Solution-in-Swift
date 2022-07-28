  class Solution {
     func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2
            guard nums[mid] != target else { return mid }

            if nums[start] < nums[mid] {
                if nums[start] <= target, target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if nums[start] > nums[mid] {
                if nums[mid] < target, target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }

            } else {
                start = mid + 1
            }

        }
        return -1
    }  
    
}
