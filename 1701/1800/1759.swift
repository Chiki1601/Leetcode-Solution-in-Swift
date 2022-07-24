class Solution {
     private let mod = 1_000_000_007


    func countHomogenous(_ s: String) -> Int {
        var ans = 0
        var cnt = 0
        var idx = s.startIndex
        var last: Character? = nil
        
        while idx < s.endIndex {
            if idx == s.startIndex { cnt += 1 } 
            else {
                if s[idx] == last! { cnt += 1 } 
                else {
                    ans += (cnt + 1) * cnt / 2 
                    if ans >= mod { ans %= mod }
                    cnt = 1
                }
            }
            last = s[idx]
            idx = s.index(after: idx)
        }
        ans += (cnt + 1) * cnt / 2 
        return  ans % mod
    }
}
