class Solution {
     func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        Int(ceil(Double(abs(nums.reduce(0, { $0 + $1 }) - goal)) / Double(limit) ))
    }
}
