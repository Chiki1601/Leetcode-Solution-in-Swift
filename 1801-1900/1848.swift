class Solution {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var ans = Int.max
        for idx in 0..<nums.count where nums[idx] == target { ans = min(ans, abs(start - idx)) }
        return ans
    }
}
