class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let possiblePoligon = getMaxPossibleNumber(nums.sorted())
        return possiblePoligon.reduce(0, +)
    }

    private func getMaxPossibleNumber(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [-1] }
        let maxNum = nums.max() ?? 0
        let sum = nums.reduce(0, +) - maxNum
        if sum > maxNum {
            return nums
        } else {
            var changedNums = nums
            changedNums.removeLast()
            return getMaxPossibleNumber(changedNums)
        }
    }
}
