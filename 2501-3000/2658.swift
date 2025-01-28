class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let (m, n) = (grid.count, grid.first?.count ?? 0)
        var grid = grid
        var res = 0

        for r in 0..<m {
            for c in 0..<n {
                res = max(res, dfs(r, c))
            }
        }

        return res

        // Returns the sum of the fishes in the connected component
        // that contains the cell (r, c).
        func dfs(_ r: Int, _ c: Int) -> Int {
            guard (0..<m).contains(r) && (0..<n).contains(c) else { return 0 }
            guard grid[r][c] > 0 else { return 0 }

            var res = grid[r][c]

            // Mark cell as visited.
            grid[r][c] = -1

            for (dr, dc) in [(-1, 0), (1, 0), (0, 1), (0, -1)] {
                res += dfs(r + dr, c + dc)
            }

            return res
        }
    }
}
