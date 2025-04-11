class Solution {
    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        (low...high).reduce(0) { count, num in
            let digits = String(num).compactMap { $0.wholeNumberValue }
            let n = digits.count
            guard n % 2 == 0 else { return count }

            let mid = n / 2
            let leftSum = digits[0..<mid].reduce(0, +)
            let rightSum = digits[mid..<n].reduce(0, +)
            return count + (leftSum == rightSum ? 1 : 0)
        }
    }
}
