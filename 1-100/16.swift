class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted()
        var i = 0
        var min = Int.max
        var res = Int.max

        while i < sorted.count - 2 {
            var j = i + 1
            var k = sorted.count - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == target {
                    return target
                }
                if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
                let diff = abs(sum - target)
                if diff < min {
                    min = diff
                    res = sum
                }
            }
            i += 1
        }
        
        return res
    }
}
