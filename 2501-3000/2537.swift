class Solution {

    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var res: Int = 0
        var count: [Int: Int] = [:]
        var remainingPairs: Int = k  // Create a mutable copy

        var i: Int = 0

        for j in 0..<nums.count {
            if count[nums[j]] == nil {
                count[nums[j]] = 0
            }

            remainingPairs -= count[nums[j]]!
            count[nums[j]]! += 1

            while remainingPairs <= 0 {
                remainingPairs += (count[nums[i]]! - 1)
                count[nums[i]]! -= 1
                i += 1
            }

            res += i
        }

        return res
    }
}
