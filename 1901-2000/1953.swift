class Solution {
    func numberOfWeeks(_ milestones: [Int]) -> Int {
        var m = Int.min
        
        let sum = milestones.reduce(into: 0) { sum, i in
            sum += i
            m = max(m, i)
        }
        if m > sum - m + 1 { return (sum - m) * 2 + 1 }
        return sum
    }
}
