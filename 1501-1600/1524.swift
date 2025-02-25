class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var runningSum = 0, counts = [1, 0], result = 0
        for num in arr {
            runningSum += num
            result += counts[(runningSum + 1) % 2]
            counts[runningSum % 2] += 1
        }
        return result % 1_000_000_007
    }
}
