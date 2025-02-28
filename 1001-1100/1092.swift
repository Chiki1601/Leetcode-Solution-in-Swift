class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let m = str1.count
        let n = str2.count
        let str1Array = Array(str1)
        let str2Array = Array(str2)
        
        // Step 1: Compute the LCS using DP
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 1...m {
            for j in 1...n {
                if str1Array[i - 1] == str2Array[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        // Step 2: Build the Shortest Common Supersequence using LCS
        // Start from the bottom right of the dp table
        var i = m
        var j = n
        var result = ""

        while i > 0 && j > 0 {
            if str1Array[i - 1] == str2Array[j - 1] {
                // If the characters are the same, add it once
                result.append(str1Array[i - 1])
                i -= 1
                j -= 1
            } else if dp[i - 1][j] > dp[i][j - 1] {
                // If coming from top has higher value, take character from str1
                result.append(str1Array[i - 1])
                i -= 1
            } else {
                // Otherwise, take character from str2
                result.append(str2Array[j - 1])
                j -= 1
            }
        }
        
        // Add remaining characters from str1 (if any)
        while i > 0 {
            result.append(str1Array[i - 1])
            i -= 1
        }

        // Add remaining characters from str2 (if any)
        while j > 0 {
            result.append(str2Array[j - 1])
            j -= 1
        }

        // Reverse the result to get the final supersequence
        return String(result.reversed())
    }
}
