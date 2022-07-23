class Solution {
     func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted(by: { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] > $1[1] })
        var ans = 0
        var prevEnd = 0

        for interval in intervals {
            guard prevEnd < interval[1] else { continue }
            ans += 1
            prevEnd = interval[1]
        }

        return ans
    }
}
