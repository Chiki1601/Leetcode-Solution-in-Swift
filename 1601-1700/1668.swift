class Solution {
     func maxRepeating(_ sequence: String, _ word: String) -> Int {
        var pattern = word
        var count = 0

        while sequence.contains(pattern) {
            pattern += word
            count += 1
        }
        return count
    }
}
