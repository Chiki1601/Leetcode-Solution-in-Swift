class Solution {
    func clearDigits(_ s: String) -> String {
        var stack: [Character] = []

        for char in s {
            if char.isNumber {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }

        return String(stack)
    }
}
