class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var maxLen: [Int: Int] = [:]
        var maxValue = 0
        
        for item in words {
            var mask = 0
            for char in item.utf8 { mask |= 1 << Int(char - 97) }
            
            if maxLen[mask] == nil { maxLen[mask] = item.count }
            else { maxLen[mask] = max(maxLen[mask]!, item.count) }
        }
        
        for item1 in maxLen {
            for item2 in maxLen {
                if (item1.key & item2.key) == 0 {
                    maxValue = max(maxValue, item1.value * item2.value)
                }
            }
        }
        
        return maxValue
    }
    
}
