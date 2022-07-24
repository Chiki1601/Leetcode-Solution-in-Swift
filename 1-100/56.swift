class Solution {
     
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        var intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var ans = [[Int]]()
        var start = intervals[0][0]
        var end = intervals[0][1]
        
        for interval in intervals {
            guard end < interval[0] else {
                end = max(end, interval[1])
                continue
            }
            ans.append([start, end])
            start = interval[0]
            end = interval[1]
        }
        
        ans.append([start, end])
        return ans
    }
}
