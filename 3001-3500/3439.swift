class Solution {
    func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var busy = 0
        var ans = 0
        
        for i in 0..<k {
            busy += endTime[i] - startTime[i]
        }
        
        if n == k {
            return eventTime - busy
        }
        
        ans = startTime[k] - busy
        
        var i = 0
        for r in k..<n {
            busy += (endTime[r] - startTime[r]) - (endTime[i] - startTime[i])
            let end = (r == n - 1) ? eventTime : startTime[r + 1]
            let start = endTime[i]
            ans = max(ans, end - start - busy)
            i += 1
        }
        
        return ans        
    }
}
