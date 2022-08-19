class Solution {
      func isPossible(_ nums: [Int]) -> Bool {
        let count = nums.count
        guard count >= 3 else { return false }

        var sum: [Int: Int] = [:]
        var cache: [Int: Int] = [:]
        
        for num in nums { sum[num] = (sum[num] ?? 0) + 1 }
        for num in nums {
            if sum[num]! == 0 { continue }
            
            if cache[num - 1] != nil && cache[num - 1]! > 0 {
                cache[num] = (cache[num] ?? 0) + 1
                cache[num - 1]! -= 1
                sum[num]! -= 1

            } else if sum[num + 1] != nil && sum[num + 1]! > 0 
                   && sum[num + 2] != nil && sum[num + 2]! > 0 {
                cache[num + 2] = (cache[num+2] ?? 0) + 1
                sum[num]! -= 1
                sum[num + 1]! -= 1
                sum[num + 2]! -= 1
            } else { return false }
        }
        
        return true
        
    }
}
