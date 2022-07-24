 class Solution{ 
func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var temp: [String: [Int]] = [:]
        var length = 0
        var start = -1
        
        for (i, c) in s.enumerated() {
            let c = String(c)
            if temp[c] == nil {
                temp[c] = [i, -1]
            } else {
                temp[c]![0] = min(temp[c]![0], i)
                temp[c]![1] = max(temp[c]![1], i)
            }
            let l = temp[c]![1] - temp[c]![0]
            if l > length {
                length = l
                start = temp[c]![0]
            }
        }
        
        if start < 0 { return -1 }
        return length - 1
    }
 }
