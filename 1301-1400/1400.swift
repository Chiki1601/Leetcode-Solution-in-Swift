class Solution {
       func canConstruct(_ s: String, _ k: Int) -> Bool {
        var counts: [Character: Int] = [:]
        var matched = 0
        var unmatched = 0
        for character in s { counts[character, default: 0] += 1 }

        for (_, count) in counts {
            matched += count / 2
            unmatched += count % 2
        }

        let max = unmatched + (matched * 2)
        let min = unmatched
        return min ... max ~= k
    }

}
