class Solution {
     private let directions: [(row: Int, col: Int)] = [(0, 1), (1, 0), (-1, 0), (0, -1)]
    private var rows = 0
    private var cols = 0
    private var landHeights = [[Int]]()
    
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        var ans = [[Int]]()
        rows = matrix.count
        cols = matrix[0].count
        landHeights = matrix
        var pacificReachable = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var atlanticReachable = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        for i in 0..<rows {
            dfs(i, 0, &pacificReachable)
            dfs(i, cols - 1, &atlanticReachable)
        }
        
        for i in 0..<cols {
            dfs(0, i, &pacificReachable)
            dfs(rows - 1, i, &atlanticReachable)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                guard pacificReachable[i][j], atlanticReachable[i][j] else { continue }
                ans.append([i, j])
            }
        }
        return ans
    }
    

    private func dfs(_ row: Int, _ col: Int, _ reachable: inout [[Bool]]) {
        reachable[row][col] = true
        
        for direction in directions {
            let newRow = row + direction.row
            let newCol = col + direction.col
            
            guard newRow >= 0, newRow < rows,
                    newCol >= 0, newCol < cols,
                    !reachable[newRow][newCol],
                    landHeights[newRow][newCol] >= landHeights[row][col]
            else { continue }
            dfs(newRow, newCol, &reachable)
        }
    }
}
