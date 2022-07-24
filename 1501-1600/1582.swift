class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var rows: [Int] = Array(repeating: 0, count: mat.count)
        var cols = Array(repeating: 0, count: mat.first?.count ?? 0)
        var ans = 0
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                rows[i] += mat[i][j]
                cols[j] += mat[i][j]
            }
        }
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count where rows[i] == 1 && cols[j] == 1 && mat[i][j] == 1 { ans += 1 }
        }
        
        return ans
    }
}
