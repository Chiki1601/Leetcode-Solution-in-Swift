class Solution {
      func boxDelivering(_ boxes: [[Int]], _ portsCount: Int, _ maxBoxes: Int, _ maxWeight: Int) -> Int {
        let n = boxes.count
        var dp = Array(repeating: 200000, count: n + 1)
        var diff = 0
        var right = 0
        var last = 0
        var remainBox = maxBoxes
        var remainWeight = maxWeight

        dp[0] = 0

        for i in 0..<n {
            while right < n, remainBox > 0, remainWeight >= boxes[right][1] { // keep expanding right
                remainBox -= 1
                remainWeight -= boxes[right][1]
                if right == 0 || boxes[right][0] != boxes[right - 1][0] { // 2 ports are different
                    last = right
                    diff += 1
                }
                right += 1
            }

            dp[right] = min(dp[right], dp[i] + diff + 1) // keep load as far as right as we can
            dp[last] = min(dp[last], dp[i] + diff) // waste some weight to save trip
            remainBox += 1 // move left pointer i
            remainWeight += boxes[i][1]

            if i == n - 1 || boxes[i][0] != boxes[i + 1][0] { diff -= 1 } // if current box port is different with previous one, reduce diff
        }

        return dp[n]
    }
}
