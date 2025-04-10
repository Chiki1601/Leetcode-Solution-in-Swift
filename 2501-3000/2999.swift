class Solution {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        func count(_ val: Int) -> Int {
            let valStr = String(val)
            let suffixLength = s.count
            let prefixLength = valStr.count - suffixLength
            
            if prefixLength < 0 { return 0 }

            var dp = Array(repeating: [0, 0], count: prefixLength + 1)
            dp[prefixLength][0] = 1
            let suffixStart = valStr.index(valStr.startIndex, offsetBy: prefixLength)
            let suffixFromVal = String(valStr[suffixStart...])
            dp[prefixLength][1] = suffixFromVal >= s ? 1 : 0

            for i in stride(from: prefixLength - 1, through: 0, by: -1) {
                let digitChar = valStr[valStr.index(valStr.startIndex, offsetBy: i)]
                let digit = digitChar.wholeNumberValue ?? 0

                dp[i][0] = (limit + 1) * dp[i + 1][0]

                if digit <= limit {
                    dp[i][1] = digit * dp[i + 1][0] + dp[i + 1][1]
                } else {
                    dp[i][1] = (limit + 1) * dp[i + 1][0]
                }
            }

            return dp[0][1]
        }

        return count(finish) - count(start - 1)
    }
}
