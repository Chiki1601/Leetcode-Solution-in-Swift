class Solution {
    
    func balancedString(_ s: String) -> Int {
        let target = s.count / 4
        var arr: [Character: Int] = [:]
        var element: [Character: Int] = [:]
        let s = [Character](s)
        var l = 0, r = 0
        var count = s.count
        
        for c in s { if arr[c] == nil { arr[c] = 1 } else { arr[c]! += 1 } }

        for key in arr.keys {
            let num = arr[key]! - target
            if num > 0 { element[key] = num }
        }

        if element.isEmpty { return 0 }

        while l <= r, r < s.count {
            if element[s[r]] != nil { element[s[r]]! -= 1 }
            let res = element.values.reduce(0) { (res, val) -> Int in res + max(val, 0) }
            
            if res == 0 {
                count = min(count, r - l + 1)
                if element[s[l]] != nil { element[s[l]]! += 1 }
                if element[s[r]] != nil { element[s[r]]! += 1 }
                l += 1
            } else { r += 1 }
        }
        
        return count
    }
}
