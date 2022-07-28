class Solution {
      
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var i = n - 2
        while i >= 0, nums[i + 1] <= nums[i] { i -= 1 }
        
        guard i >= 0 else {
            reverse(&nums, start: i + 1, end: n - 1)
            return
        }
        
        var j = n - 1
        while j >= 0, nums[j] <= nums[i] { j -= 1 }
        nums.swapAt(i, j)
        reverse(&nums, start: i + 1, end: n - 1)
    }
    

    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var i = start
        var j = end
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

}
