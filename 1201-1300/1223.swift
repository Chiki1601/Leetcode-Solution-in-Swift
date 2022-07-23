class Solution {
   func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        let mod = Int(1e9 + 7)
        let m = rollMax.count // 6
        // dp[i][j]
        // - j in [0...m-1] at i th rolling, how many combination with last dice is j
        // - j == m, at i th rolling, total combinations
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

        dp[0][m] = 1 // roll 0 times, total combination is 1
        for j in 0..<m { dp[1][j] = 1 } // roll 1 times, combination end at j is 1
        dp[1][m] = m // roll 1 times, total combination is 6
        for i in 2...n {
            for j in 0..<m {
                // at each [i, j], trying to go up (decrease i) and collect all the sum of previous state
                for k in 1...min(i, rollMax[j]) { dp[i][j] += dp[i - k][m] - dp[i - k][j] }
            }
            dp[i][m] = dp[i].reduce(into: 0) { res, next in res += next } % mod
        }

        return dp[n][m] < 0 ? mod + dp[n][m] : dp[n][m]
    }
}
