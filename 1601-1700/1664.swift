class Solution {
      func waysToMakeFair(_ nums: [Int]) -> Int {
        var cache: [[Int]] = Array(repeating: [0, 0], count: nums.count)
        var ans = 0
        
        for i in 0..<nums.count {
            let n = nums[i]
            if i == 0 {
                cache[i][0] = n
                cache[i][1] = 0
                continue
            }
            if i % 2 == 0 {
                cache[i][0] = cache[i - 1][0] + n
                cache[i][1] = cache[i - 1][1]
            } else {
                cache[i][0] = cache[i - 1][0]
                cache[i][1] = cache[i - 1][1] + n
            }
        }
        
        for i in 0..<nums.count {
            var even = cache[i][0]
            var odd = cache[i][1]
            even += cache.last![1] - cache[i][1]
            odd += cache.last![0] - cache[i][0]
            
            if i % 2 == 0 { even -= nums[i] } 
            else { odd -= nums[i] }

            if even == odd { ans += 1 }
        }
        
        return ans
    }

   
}
