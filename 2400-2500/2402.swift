class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { m1, m2 in
            m1[0] < m2[0]
        }

        var counter = [Int](repeating: 0, count: n)
        var emptyTime = [Int](repeating: 0, count: n)
        for meeting in sortedMeetings {
            let (s,e) = (meeting[0],meeting[1])
            for i in 0..<n {
                if emptyTime[i] <= s {
                    emptyTime[i] = 0
                }
            }
            var targetNum = 0
            for i in 0..<n {
                if emptyTime[i] < emptyTime[targetNum] {
                    targetNum = i
                }
            }
            counter[targetNum] += 1
            if emptyTime[targetNum] == 0 {
                emptyTime[targetNum] = e
            } else {
                emptyTime[targetNum] += e - s
            }
        }
        let maxCnt = counter.max() ?? -1
        return counter.firstIndex(of: maxCnt) ?? -1

    }
}
