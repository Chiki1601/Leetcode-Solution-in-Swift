class Solution {
    private let  directions = [1, 0, -1, 0, 1]


    func containsCycle(_ grid: [[Character]]) -> Bool {
        var gridCopy = grid.map { $0.map { $0.asciiValue! } }
        let m = grid.count
        let n = grid[0].count

        for r in 0..<m {
            for c in 0..<n {
                if gridCopy[r][c] >= 97 {
                    let target = gridCopy[r][c]
                    var queue = [Int]()
                    queue.append(r << 16 | c)

                    while !queue.isEmpty {
                        var nextLevel = [Int]()
                        for p in queue {
                            let x = p >> 16
                            let y = p & 0xffff
                            if gridCopy[x][y] < 97 { return true }
                            gridCopy[x][y] -= 26
                            for j in 0..<4 {
                                let nextX = x + directions[j]
                                let nextY = y + directions[j + 1]
                                if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n && gridCopy[nextX][nextY] == target {
                                    nextLevel.append(nextX << 16 | nextY)
                                }
                            }
                        }
                        queue = nextLevel
                    }
                }
            }
        }
        return false
    }

}
