class Solution {
   
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var res: [[Int]] = []
        var i = 0
        
        while i < sorted.count - 3 {
            if i > 0, sorted[i] == sorted[i - 1] { i += 1; continue }
            var j = i + 1
            while j < sorted.count - 2 {
                if j - 1 > i, sorted[j] == sorted[j - 1] { j += 1; continue }
                var k = j + 1
                var l = sorted.count - 1
                
                while k < l {
                    let sum = sorted[i] + sorted[j] + sorted[k] + sorted[l]
                    if sum == target {
                        if k - 1 > j, sorted[k] == sorted[k - 1] { k += 1; continue }
                        res.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                        k += 1
                    }
                    if sum < target {
                        k += 1
                    } else {
                        l -= 1
                    }
                }
                j += 1
            }
            i += 1
        }

        return res
    }
}
