class Solution {
      func minSideJumps(_ obstacles: [Int]) -> Int {
        let n = obstacles.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n)
        
        if obstacles[0] != 0 {
            dp[0][obstacles[0]] = Int.max
            dp[0][4 - obstacles[0]] = 1
        } else {
            dp[0][1] = 1
            dp[0][3] = 1
        }

        for idx in 1..<n {    
            if obstacles[idx] != 0 { dp[idx][obstacles[idx]] = Int.max }

            for path in 1...3 where path != obstacles[idx] {
                if dp[idx - 1][path] == Int.max {
                    var ans = Int.max
                    for p in 1...3 where p != obstacles[idx] { ans = min(ans, dp[idx - 1][p]) }
                    dp[idx][path] = ans + 1
                } else { dp[idx][path] = dp[idx - 1][path] }
            }
        }
        return min(dp[n - 1][3], dp[n - 1][1],dp[n - 1][2])
    }
}
