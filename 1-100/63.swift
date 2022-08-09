class Solution {
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        matrix[0][0] = 1
        for i in 0..<obstacleGrid.count {
            for j in 0..<obstacleGrid[0].count {
                if i > 0 { matrix[i][j] += matrix[i - 1][j] }
                if j > 0 { matrix[i][j] += matrix[i][j - 1] }
                if obstacleGrid[i][j] == 1 { matrix[i][j] = 0 }
            }
        }
        
        return matrix[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
    }
}
