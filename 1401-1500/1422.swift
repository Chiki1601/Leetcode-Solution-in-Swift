class Solution {
     func maxScore(_ s: String) -> Int {
        var i = 0
        var maxScore = 0
        var nums: [Int] = []
        var leftSum = 0
        var rightSum = 0
        var sum = 0

        for char in s {
            if char == "1" {
                nums.append(1)
                sum += 1
            } else {
                nums.append(0)
            }
        }

        rightSum = sum
        while i < s.count - 1 {
            leftSum += 1 - nums[i]
            rightSum = rightSum - nums[i]
            sum = leftSum + rightSum
            if sum > maxScore { maxScore = sum }
            i += 1
        }

        return maxScore
    }
}
