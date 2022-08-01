class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            for j in 0..<m {
                if i == 0 || j == 0 {
                    matrix[i][j] = 1
                } else {
                    matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
                }
            }
        }
        
        return matrix[n - 1][m - 1]
    }

}
