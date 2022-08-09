class Solution {
     func minPathSum(_ grid: [[Int]]) -> Int {
        var matrix: [[Int]] = grid
        let n = grid.count - 1
        let m = grid[0].count - 1
        
        for i in 0...n {
            for j in 0...m {
                var step = matrix[i][j]
        
                if i > 0 && j > 0 {
                    step += min(matrix[i - 1][j], matrix[i][j - 1])
                } else if i > 0 && j == 0 {
                    step += matrix[i - 1][j]
                } else if j > 0 && i == 0 {
                    step += matrix[i][j - 1]
                }
                
                matrix[i][j] = step
            }
        }
        
        return matrix[n][m]
    }

}
