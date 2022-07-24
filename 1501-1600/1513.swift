class Solution {
      private let mod = 1_000_000_007


    func numSub(_ s: String) -> Int {
        var ans = 0
        var cntOnes = 0

        for ch in s {
            if ch == "0" {
                if cntOnes != 0 {
                    ans += (cntOnes * (1 + cntOnes)) >> 1
                    ans %= mod
                }
                cntOnes = 0
            } else {
                cntOnes += 1
            }
        }

        if cntOnes != 0 {
            cntOnes %= mod
            ans += (cntOnes * (1 + cntOnes)) >> 1
            ans %= mod
        }
        
        return ans
    }
}
