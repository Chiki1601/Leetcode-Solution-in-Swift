class Solution {
      func lengthOfLastWord(_ s: String) -> Int {
        var ans = 0

        for c in s.reversed() {
            if c != " " {
                ans += 1
            } else if ans > 0 {
                return ans
            }
        }

        return ans
    }

}
