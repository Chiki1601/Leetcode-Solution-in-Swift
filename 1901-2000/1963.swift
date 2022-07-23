class Solution {
      func minSwaps(_ s: String) -> Int {
        var s = Array(s)
        let n = s.count
        var l = 0
        var r = n - 1
        var left = 0
        var swap = 0
        
        while l < r {
            if s[l] == "[" { left += 1; l += 1 } 
            else {
                left -= 1
                if left < 0 {
                    swap += 1
                    while r > l {
                        if s[r] == "[" { break }
                        r -= 1
                    }
                    s.swapAt(l, r)
                    l += 1
                    r -= 1
                    left = 1
                } else { l += 1 }
            }
        }
        return swap
    }
}
