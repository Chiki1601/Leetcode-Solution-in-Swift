class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        num > 0 && (log(Double(num)) / log(2.0)).truncatingRemainder(dividingBy: 2) == 0
    }
}
