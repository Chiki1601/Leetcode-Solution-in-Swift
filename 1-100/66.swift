class Solution {
   
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits

        for i in (0..<digits.count).reversed() {
            guard digits[i] == 9 else {
                digits[i] += 1
                return digits
            }

            digits[i] = 0
        }

        digits.insert(1, at: 0)
        return digits
    }
}
