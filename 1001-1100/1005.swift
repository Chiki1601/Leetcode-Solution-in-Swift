class Solution {
    func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
        var A = A
        var K = K
        var minAbs = Int.max

        A.sort()

        // Reverse all negative numbers
        for i in 0..<A.count {
            minAbs = min(minAbs, abs(A[i]))
            if A[i] < 0 {
                A[i] = -A[i]
                K -= 1
                if K == 0 { return A.reduce(0, +) }
            } else if A[i] == 0 {
                return A.reduce(0, +)
            } else { break }
        }
        
        var sum = A.reduce(0, +)
        // Reverse minimum number, diff is double value
        if K % 2 != 0 { sum -= 2 * minAbs }    
        return sum
    }
}
