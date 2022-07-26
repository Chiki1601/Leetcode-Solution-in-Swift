class Solution {
      func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var res: [[Int]] = []
        let sorted = nums.sorted()
        var i = 0
        
        while i < sorted.count - 2 {
            if i > 0, sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            
            var j = i + 1
            var k = sorted.count - 1
            
            while j < k {
                let target = sorted[i] + sorted[j] + sorted[k]
                if (target == 0) {
                    if j - 1 > i, sorted[j] == sorted[j - 1] {
                        j += 1
                        continue
                    } 
                    res.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                } else if (target < 0) {
                    j += 1
                } else {
                    k -= 1
                }
            }
            i += 1
        }
        
        return res
    }
    
}
