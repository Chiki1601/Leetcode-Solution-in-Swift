class Solution {
       func findTheLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var status = 0
        var maps = [Int: Int]()
        var res = 0
        maps[0] = 0

        for i in 0..<chars.count {
            switch chars[i] {
            case "a": status = status ^ (1 << 0); break
            case "e": status = status ^ (1 << 1); break
            case "i": status = status ^ (1 << 2); break
            case "o": status = status ^ (1 << 3); break
            case "u": status = status ^ (1 << 4); break
            default: break
            }

            if let v = maps[status] {
                res = max(res, i - v + 1)
            } else {
                maps[status] =  i + 1
            }
        }
        
        return res
    }
}
