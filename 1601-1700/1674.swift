class Solution {
  
    func minMoves(_ nums: [Int], _ limit: Int) -> Int {
        let n = nums.count
        var times = [Int](repeating: 0, count: 2 * limit + 2)
        var ans = n
        var sum = 0
        
        for idx in 0..<(n >> 1) {
            let a = nums[idx]
            let b = nums[n - 1 - idx]
            times[2] += 2
            times[2 * limit + 1] -= 2
            times[1 + min(a, b)] += -1
            times[limit + max(a, b) + 1] -= -1
            times[a + b] += -1
            times[a + b + 1] -= -1
        }

        for idx in 2...(limit * 2) {
            sum += times[idx]
            if sum < ans { ans = sum }
        }
        
        return ans
    }
}
