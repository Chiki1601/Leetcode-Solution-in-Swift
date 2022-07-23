class Solution {
   
    func countSquares(_ matrix: [[Int]]) -> Int {
        var m: Int = matrix.count
        var n: Int = matrix[0].count
        var dp: [[Int]] = matrix.map{$0}
        var result: Int = 0

        for i in 0..<m {
            for j in 0..<n {
                if i > 0 && j > 0 && dp[i][j] >= 1 {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                }
                result += dp[i][j]
            }
        }

        return result
    }
}
