class Solution {
    
    func addRungs(_ rungs: [Int], _ dist: Int) -> Int {
        var needStairs = 0
        var pre = 0

        for i in 0..<rungs.count {
            let delta = rungs[i] - pre
            pre = rungs[i]
            if delta <= dist { continue }
            needStairs += (delta  - 1) / dist
        }
        return needStairs
    }
}
