class Solution {
      func minOperations(_ boxes: String) -> [Int] {
        let n = boxes.count
        let balls = boxes.map { $0 == "1" }
        var ballCnt = 0
        var preffix: [Int] = []
        var suffix = [Int]()

        for ball in balls {
            preffix.append((preffix.last ?? 0) + ballCnt)
            if ball { ballCnt += 1 }
        }

        ballCnt = 0

        for ball in balls.reversed() {
            suffix.insert((suffix.first ?? 0) + ballCnt, at: 0)
            if ball { ballCnt += 1 }
        }

        return (0..<n).map { preffix[$0] + suffix[$0] }
    }
}
