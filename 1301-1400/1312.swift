class Solution {
  func minInsertions(_ s: String) -> Int {
        var chars = [Character](s)
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if chars[i] != chars[j] { break }
            i += 1
            j -= 1
        }
        
        guard i < j else { return 0 }
        guard s.count != 2 else { return 1 }
        chars.removeFirst(i)
        chars.removeLast(s.count - j - 1)
        let n = chars.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
        
         i = n - 1
        while i >= 0 {
            j = i + 1
            while j < n {
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i + 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i][j - 1], dp[i + 1][j]) + 1
                }
                j += 1
            }
            i -= 1
        }
        
        return dp[0][n - 1]
    }
}
