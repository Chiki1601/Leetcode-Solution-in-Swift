class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in 0..<(nums.count - 1) {
            for j in (i + 1)..<nums.count {
                dict[nums[i] * nums[j], default: Int(0)] += 1
            }
        }
        return dict.values.reduce(into: Int(0), { if $1 > 1 { $0 += $1 * 4 * ($1 - 1) } })
    }
}
