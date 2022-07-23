class Solution {
    
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        var s = Array(s)
        var t = Array(t)
        var left = 0, right = 0
        var cost = 0, ans = 0
        
        while right < t.count && cost <= maxCost {
            let dif = abs(Int(s[right].asciiValue!) - Int(t[right].asciiValue!))
            cost += dif
            while cost > maxCost {
                cost -= abs(Int(s[left].asciiValue!) - Int(t[left].asciiValue!))
                left += 1
            }
            right += 1
            ans = max(ans, right - left)
        }
        
        return ans
    }
    
}
