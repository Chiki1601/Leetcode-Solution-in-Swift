class Solution {
     func concatenatedBinary(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var length = 0
        var ans = 0
        
        for i in 1...n {
            if i & (i - 1) == 0 { length += 1 }
            ans = ((ans << length) | i) % mod
        }
        
        return ans
    }

}
