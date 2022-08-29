class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        
        var grid = grid
        var output = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    output += 1
                    removeIsland(&grid, i, j)
                }
            }
        }
        
        return output
    }
    
    
    func removeIsland(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0, j >= 0, i < grid.count, j < grid[i].count, grid[i][j] == "1" else { return }
        
        grid[i][j] = "0"
        
        removeIsland(&grid, i, j + 1)
        removeIsland(&grid, i + 1, j)
        removeIsland(&grid, i, j - 1)
        removeIsland(&grid, i - 1, j)
    }
}
