class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        if grid.isEmpty {
            return [[]]
        }
        var rows = Array(repeating: 0, count: grid.count)
        var col = Array(repeating: 0, count: grid[0].count)
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    rows[i] += 1
                    col[j] += 1
                }
            }
        }
        var m = grid
        var ss = grid.count
        var sj = grid[0].count
         for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                m[i][j] = rows[i]+col[j]-(ss-rows[i]+sj-col[j])
            }
        }
        
        return m
        
    }
}
