class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var result = 0 
        for i in 0..<n {
            for j in (i + 1)..<n {
                if nums[i] == nums[j] && (i * j) % k == 0 {
                    result += 1
                }
            }
        }
        return result        
    }
}
