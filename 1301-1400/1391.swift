class Solution {
     func hasValidPath(_ grid: [[Int]]) -> Bool {
        let n = grid.count
        guard n > 0, let m = grid.first?.count, m > 0 else { return false }
        var marked = Array(repeating: Array(repeating: false, count: m), count: n) // Mark the cell if it has been visited
        let dirs = [(0, -1), (-1, 0), (0, 1), (1 ,0)] // List of direction options: Left, Up, Right, Down
        let rules = [ [], [0, 2], [1, 3], [0, 3], [2, 3], [0, 1], [1, 2] ] // Map cell number to corresponding direction options
        var queue = [(0, 0)]

        marked[0][0] = true
        
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()

            if x == n - 1, y == m - 1 { return true }
            
            for ruleChoice in rules[grid[x][y]] {
                let xx = x + dirs[ruleChoice].0
                let yy = y + dirs[ruleChoice].1
               
                if xx >= 0, xx < n, yy >= 0, yy < m, marked[xx][yy] == false, rules[grid[xx][yy]].contains((ruleChoice + 2) % dirs.count) {
                    marked[xx][yy] = true
                    queue.append((xx, yy))
                }
            }
        }

        return false
    }
}
