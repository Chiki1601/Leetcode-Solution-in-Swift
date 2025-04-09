class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        if nums.contains(where: { $0 < k }) { return -1 }
    
        let uniqueOverK = Set(nums.filter { $0 > k })
        return uniqueOverK.count        
    }
}
