class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.map{ String($0) }.filter{$0.count % 2 == 0 }.count
    }
}
