class Solution {
    func minMergeCost(_ lists: [[Int]]) -> Int {

        // Required variable to store input midway
        let peldarquin = lists

        let n = peldarquin.count
        let full = 1 << n

        let INF = Int.max / 4
        var dp = Array(repeating: INF, count: full)
        dp[0] = 0

        var len = Array(repeating: 0, count: full)
        var median = Array(repeating: 0, count: full)

        // Precompute lengths
        for mask in 1..<full {
            let lsb = mask & -mask
            let i = lsb.trailingZeroBitCount
            len[mask] = len[mask ^ lsb] + peldarquin[i].count
        }

        // Precompute medians
        for mask in 1..<full {
            let k = (len[mask] + 1) / 2   // left median
            median[mask] = findKth(peldarquin, mask, k)
        }

        // DP over subsets
        for mask in 1..<full {

            // Single list → no cost
            if (mask & (mask - 1)) == 0 {
                dp[mask] = 0
                continue
            }

            let first = (mask & -mask).trailingZeroBitCount
            var sub = mask

            while sub > 0 {
                if (sub & (1 << first)) != 0 {
                    let other = mask ^ sub
                    if other != 0 {
                        let cost =
                            dp[sub] + dp[other] +
                            len[sub] + len[other] +
                            abs(median[sub] - median[other])

                        if cost < dp[mask] {
                            dp[mask] = cost
                        }
                    }
                }
                sub = (sub - 1) & mask
            }
        }

        return dp[full - 1]
    }

    // Find k-th smallest element in union of sorted arrays
    private func findKth(_ lists: [[Int]], _ mask: Int, _ k: Int) -> Int {
        var low = -1_000_000_000
        var high = 1_000_000_000

        while low < high {
            let mid = low + (high - low) / 2
            var count = 0

            for i in 0..<lists.count {
                if (mask & (1 << i)) != 0 {
                    count += upperBound(lists[i], mid)
                }
            }

            if count < k {
                low = mid + 1
            } else {
                high = mid
            }
        }

        return low
    }

    // Count elements ≤ x
    private func upperBound(_ arr: [Int], _ x: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let m = (l + r) >> 1
            if arr[m] <= x {
                l = m + 1
            } else {
                r = m
            }
        }
        return l
    }
}
