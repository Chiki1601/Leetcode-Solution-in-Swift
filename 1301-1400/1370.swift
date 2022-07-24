class Solution {
  func sortString(_ s: String) -> String {
        var s = Array(s), dict = Array(repeating: 0, count: 26), ans: [Character] = [], flag = false
        var i = 0
        var stride = 1
        
        for c in s {
            let i = Int(c.asciiValue!) - 97
            dict[i] += 1
        }
        
        while true {
            if i < 0 {
                i = 0
                stride = 1
                if !flag { break }
                flag = false
            }

            if i >= dict.count {
                i = dict.count - 1
                stride = -1
                if !flag { break }
                flag = false
            }
            
            if dict[i] > 0 {
                ans.append(Character(String(UnicodeScalar(UInt8(i+97)))))
                dict[i] -= 1
                flag = true
            }
            
            i += stride
        }
        
        return String(ans)
    }
}
