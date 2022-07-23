class Solution {
     func maxPoints(_ points: [[Int]]) -> Int {
        guard let firstRow = points.first else { return 0 }
        let m = points.count
        let n = firstRow.count
        var dp = [Int](repeating: 0, count: n)
        var cur = dp
        var ans = 0

        for i in 0..<m {
            var lmax = 0
            for j in 0..<n {
                lmax = max(lmax - 1, dp[j])
                cur[j] = lmax
            }
            var rmax = 0
            for j in (0...n - 1).reversed() {
                rmax = max(rmax - 1, dp[j])
                cur[j] = max(cur[j], rmax)
            }
            for j in 0..<n { dp[j] = cur[j] + points[i][j] }
        }
        for j in 0..<n { ans = max(ans, dp[j]) }
        return ans
    }

}
