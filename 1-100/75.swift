class Solution {
      func sortColors(_ nums: inout [Int]) {
        var zeroIndex = 0
        var twoIndex = nums.count - 1
        var i = 0

        while i <= twoIndex {
            if nums[i] == 0, i > zeroIndex {
                nums.swapAt(i, zeroIndex)
                zeroIndex += 1

            } else if nums[i] == 2, i < twoIndex {
                nums.swapAt(i, twoIndex)
                twoIndex -= 1

            } else {
                i += 1
            }
        }
    }

}
