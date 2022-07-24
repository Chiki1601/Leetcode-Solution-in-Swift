class Solution {
  
    private let mod = 1_000_000_007
    private typealias Answer = (min: Int, max: Int)
    

    func maxProductPath(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return -1 }
        guard !grid[0].isEmpty else { return -1 }
        let m = grid.count
        let n = grid[0].count

        guard m * n > 1 else {  return grid[0][0] >= 0 ? grid[0][0] : -1 }
        var dp: [[Answer]] = [[Answer]](repeating: [Answer](repeating: (Int.max, Int.min), count: n), count: m)
        dp[0][0] = (grid[0][0], grid[0][0])
        
        if m > 1 {
            for r in 1..<m {
                let t = grid[r][0] * dp[r - 1][0].max
                dp[r][0] = (t,t)
            }
        }
        
        if n > 1 {
            for c in 1..<n {
                let t = grid[0][c] * dp[0][c - 1].min
                dp[0][c] = (t,t)
            }
        }

        guard m > 1 && n > 1 else { return dp[m - 1][n - 1].max >= 0 ? dp[m - 1][n - 1].max % mod : -1 }
        for r in 1..<m {
            for c in 1..<n {
                let ans = [grid[r][c] * dp[r - 1][c].min, grid[r][c] * dp[r - 1][c].max, grid[r][c] * dp[r][c - 1].min, grid[r][c] * dp[r][c - 1].max]
                dp[r][c] = (ans.min()!, ans.max()!)
            }
        }
        return dp[m - 1][n - 1].max >= 0 ? dp[m - 1][n - 1].max % mod : -1
    }
}
