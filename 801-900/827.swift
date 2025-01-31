class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        let (m, n) = (grid.count, grid.first?.count ?? 0)
        var grid = grid
        var color = 1
        var sizeForIsland = [0, 0]

        // Paint the different islands with "colors" 2, 3, 4, ...
        // Note that we don't use 0 (water) or 1 (unvisited island) as colors.
        for row in 0..<m {
            for col in 0..<n where grid[row][col] == 1 {
                color += 1
                var islandSize = 0
                paintIsland(row, col, color, &islandSize)
                sizeForIsland.append(islandSize)
            }
        }

        // For "water" cells, compute the size of the new island we will be creating.
        var res = 0
        for row in 0..<m {
            for col in 0..<n where grid[row][col] == 0 {
                // Get the colors of the neighboring islands.
                var neighborColors = Set<Int>()
                for (dr, dc) in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
                    if !(0..<m).contains(row + dr) || !(0..<n).contains(col + dc) { continue }
                    neighborColors.insert(grid[row + dr][col + dc])
                }

                // Compute the size of the new island based on the neighboring islands.
                let newIslandSize = 1 + neighborColors.map { sizeForIsland[$0] }.reduce(0, +)
                res = max(res, newIslandSize)
            }
        }
        return res == 0 ? m * n : res

        // Use DFS to paint the island and compute its size along.
        func paintIsland(_ row: Int, _ col: Int, _ color: Int, _ islandSize: inout Int) {
            guard (0..<m).contains(row) && (0..<n).contains(col) else { return }
            if grid[row][col] != 1 { return }

            grid[row][col] = color
            islandSize += 1

            for (dr, dc) in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
                paintIsland(row + dr, col + dc, color, &islandSize)
            }
        }
    }
}
