class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        let sorted = points.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
        let ys = sorted.map { $0[1] }
        var result = 0

        for i in 0..<ys.count {
            var maxY = Int.min
            for j in (i+1)..<ys.count where ys[i] >= ys[j] {
                if maxY < ys[j] {
                    result += 1
                    maxY = ys[j]
                }
            }
        }

        return result
    }
}
