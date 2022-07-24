class Solution {
     private let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]


    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let m = isWater.count
        let n = isWater[0].count
        var depth = 0
        var queue = [(Int, Int)]()
        var ans = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)

        for r in 0..<m {
            for c in 0..<n where isWater[r][c] == 1 {
                queue.append((r,c))
                ans[r][c] = 0
            }
        }
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [(Int, Int)]()
            for (x,y) in queue {               
                for (dx,dy) in directions {
                    let (nx, ny) = (x + dx, y + dy)
                    guard nx >= 0 && nx < m && ny >= 0 && ny < n else { continue }
                    guard ans[nx][ny] == -1 else { continue }
                    ans[nx][ny] = depth
                    nextLevel.append((nx,ny))
                }
            }
            queue = nextLevel
        }
        return ans
    }
}
