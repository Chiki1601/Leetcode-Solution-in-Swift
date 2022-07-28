class Solution {
      func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var index = -1
        var lower = 0
        var upper = nums.count - 1
        var mid = (lower + upper) / 2

        while upper >= lower {
            if nums[mid] == target { index = mid; break }
            if mid == lower {
                if nums[upper] == target { index = upper }
                break
            }
            if nums[mid] > target {
                upper = mid
            } else {
                lower = mid
            }
            mid = (lower + upper) / 2
        }
        
        if index == -1 {
            return [-1, -1]
        } else {
            var i = index
            var j = index
            while i > 0 {
                if nums[i] == nums[i-1] { i -= 1 } else { break }
            }
            while j < nums.count - 1 {
                if nums[j] == nums[j+1] { j += 1 } else { break }
            }
            return [i, j]
        }
    }

}
