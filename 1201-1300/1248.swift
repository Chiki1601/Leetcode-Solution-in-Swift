class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var h = 0, t = 0
        var count = nums.count
        var odd = 0
        var ans = 0
        
        while h <= t && t < count {
            var pre = 1
            var suf = 1
            
            while h < count && !isOdd(nums[h]) { pre += 1; h += 1 }

            while t < count && odd < k {
                if isOdd(nums[t]) { odd += 1 }
                t += 1
            }

            while t < count && !isOdd(nums[t]) { t += 1; suf += 1 }
            
            if odd == k { ans += pre * suf }
            h += 1
            odd -= 1
        }

        return ans
    }
    
    
    private func isOdd(_ n: Int) -> Bool { n % 2 == 1 }
}
