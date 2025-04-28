class Solution {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Int] {
        let sortedIndices = (0..<n).sorted { nums[$0] < nums[$1] }
        var position = [Int](repeating: 0, count: n)
        var values = [Int](repeating: 0, count: n)

        for (idx, i) in sortedIndices.enumerated() {
            position[i] = idx
            values[idx] = nums[i]
        }

        var reachableIndex = [Int](repeating: 0, count: n)
        var j = 0
        for i in 0..<n {
            if j < i { j = i }
            while j + 1 < n && values[j + 1] - values[i] <= maxDiff {
                j += 1
            }
            reachableIndex[i] = j
        }

        var maxLog = 1
        while (1 << maxLog) < n { maxLog += 1 }

        var upTable = [[Int]](repeating: [Int](repeating: 0, count: n), count: maxLog)
        upTable[0] = reachableIndex

        for k in 1..<maxLog {
            for i in 0..<n {
                upTable[k][i] = upTable[k - 1][upTable[k - 1][i]]
            }
        }

        return queries.map { query in
            var (start, finish) = (query[0], query[1])
            if start == finish { return 0 }

            var (startPos, endPos) = (position[start], position[finish])
            if startPos > endPos { swap(&startPos, &endPos) }

            if abs(nums[start] - nums[finish]) <= maxDiff { return 1 }

            if reachableIndex[startPos] < endPos {
                var current = startPos
                var jumpCount = 0
                for k in (0..<maxLog).reversed() {
                    if upTable[k][current] < endPos {
                        if upTable[k][current] == current { return -1 }
                        current = upTable[k][current]
                        jumpCount += (1 << k)
                    }
                }
                return reachableIndex[current] >= endPos ? jumpCount + 1 : -1
            } else {
                return 1
            }
        }
    }
}
