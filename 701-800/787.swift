class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var grid = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for flight in flights {
            grid[flight[1]][flight[0]] = flight[2]
        }
        var k = K
        var dsts = [(dst, 0)], nextDst = [(Int, Int)]()
        var ans = Int.max
        while dsts.count > 0 && k >= 0 {
            let (validDst, v) = dsts.removeFirst()
            for i in grid[validDst].indices {
                if grid[validDst][i] != 0 {
                    if i == src { ans = min(ans, grid[validDst][i] + v) }
                    else {
                        if ans >= grid[validDst][i] + v  {
                            nextDst.append((i, grid[validDst][i] + v))
                        }
                    }
                }
            }
            if dsts.count == 0 {
                dsts = nextDst
                nextDst.removeAll()
                k -= 1
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
