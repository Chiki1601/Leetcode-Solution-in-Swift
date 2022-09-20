class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        var tokens = tokens.sorted(by: <)
        var P = P
        var points = 0
        var ans = 0
        var i = 0
        var j = tokens.count - 1

        while i <= j {
            guard P >= tokens[i] || points > 0 else { break }

            if P >= tokens[i] {
                P -= tokens[i]
                i += 1
                points += 1
                ans = max(ans, points)
            } else {
                points -= 1
                P += tokens[j]
                j -= 1
            }
        }

        return ans
    }

}
