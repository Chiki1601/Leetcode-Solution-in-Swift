class Solution {
    func minBitwiseArray(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for num in nums {
            var found = false
            for i in 0...num {
                if i | (i + 1) == num {
                    result.append(i)
                    found = true
                    break
                }
            }
            if !found {
                result.append(-1)
            }
        }
        return result
    }
}
