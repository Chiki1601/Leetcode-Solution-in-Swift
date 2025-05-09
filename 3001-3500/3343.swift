class Solution {
    func countBalancedPermutations(_ num: String) -> Int {
        let mod = 1_000_000_007
        let n = num.count

        // Count digit frequencies and total sum.
        var freq = [Int](repeating: 0, count: 10)
        var totalSum = 0
        for ch in num {
            if let digit = ch.wholeNumberValue {
                freq[digit] += 1
                totalSum += digit
            }
        }
    
        guard totalSum.isMultiple(of: 2) else {
            // Can't balance.
            return 0
        }

        let halfSum = totalSum / 2
        let oddSlotCount = (n + 1) / 2
        let evenSlotCount = n - oddSlotCount

        // Build Pascal's triangle.
        var binom = Array(repeating: Array(repeating: 1, count: oddSlotCount + 1), count: oddSlotCount + 1)
        for i in 1...oddSlotCount {
            for j in 1..<i {
                binom[i][j] = (binom[i - 1][j] + binom[i - 1][j - 1]) % mod
            }
        }

        // dp[curSum][oddUsed] = number of ways to reach curSum using exactly oddUsed digits in odd positions
        var dp = Array(repeating: Array(repeating: 0, count: oddSlotCount + 1), count: halfSum + 1)
        dp[0][0] = 1

        var processedDigits = 0       // how many digits we've assigned so far
        var runningTotal = 0         // sum of those digits
        for digit in 0...9 where freq[digit] > 0 {
            let count = freq[digit]
            processedDigits += count
            runningTotal += digit * count

            // Compute valid ranges for oddUsed and curSum.
            let maxOddUse = min(processedDigits, oddSlotCount)
            let minOddUse = max(0, processedDigits - evenSlotCount)
            let maxSum = min(runningTotal, halfSum)
            let minSum = max(0, runningTotal - halfSum)

            // Update dp in-place backwards.
            for oddUsed in (minOddUse...maxOddUse).reversed() {
                let evenUsed = processedDigits - oddUsed
                for curSum in (minSum...maxSum).reversed() {
                    var waysTotal = 0
                    let minChooseOdd = max(0, count - evenUsed)
                    let maxChooseOdd = min(count, oddUsed)
                    if minChooseOdd <= maxChooseOdd {
                        for chooseOdd in minChooseOdd...maxChooseOdd {
                            let prevSum = curSum - digit * chooseOdd
                            if prevSum < 0 { break }
                            let prevOdd = oddUsed - chooseOdd
                            let ways = ((binom[oddUsed][chooseOdd] * binom[evenUsed][count - chooseOdd] % mod) * dp[prevSum][prevOdd]) % mod
                            waysTotal = (waysTotal + ways) % mod
                        }
                    }
                    dp[curSum][oddUsed] = waysTotal
                }
            }
        }

        return dp[halfSum][oddSlotCount]
    }
}
