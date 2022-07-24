class Solution {
     func reductionOperations(_ nums: [Int]) -> Int {
        let minEle = nums.min()!
        var counter = [Int](repeating: 0, count: 5 * 10000 + 5)
        var ans = 0
        var pre = 0

        for num in nums { counter[num] += 1 }

        for  idx in stride(from: 50001, through: 1, by: -1) {
            guard idx > minEle else { break }
            if counter[idx] > 0 {
                pre += counter[idx]
                ans += pre 
            }
        }
        return ans
    }
}
