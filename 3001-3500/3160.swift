class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var colorFreq = [Int: Int]()
        var balls = [Int: Int]()
        var result = [Int]()
        for q in queries {
            let (x, y) = (q[0], q[1])
            if let oldColor = balls[x] {
                colorFreq[oldColor]! -= 1
                if colorFreq[oldColor]! == 0 { colorFreq[oldColor] = nil }
            }
            balls[x] = y
            colorFreq[y, default: 0] += 1
            result.append(colorFreq.count)
        }
        return result
    }
}
