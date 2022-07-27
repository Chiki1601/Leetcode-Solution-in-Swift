class Solution {
     
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var comb = [Int]()
        
        backtrack(remain: target, comb: &comb, start: 0, candidates: candidates, ans: &ans)
        return ans
    }


    private func backtrack(remain: Int, comb: inout [Int], start: Int, candidates: [Int], ans: inout [[Int]]) {
        guard remain >= 0 else { return }
        guard remain != 0 else { ans.append(comb); return }

        for i in start..<candidates.count {
            comb.append(candidates[i])
            backtrack(remain: remain - candidates[i], comb: &comb, start: i, candidates: candidates, ans: &ans)
            comb.removeLast()
        }
    }
}
