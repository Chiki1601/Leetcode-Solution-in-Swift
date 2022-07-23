class Solution {
  
    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        var s = Array(s)
        var words = words.map { Array($0) }
        var iw = 0
        var iw2 = 0

        for i in 0..<s.count {
            let c = s[i]
            if c == words[iw][iw2] {
                iw2 += 1
                if iw2 == words[iw].count {
                    iw += 1
                    iw2 = 0
                    if iw == words.count { return i == s.count - 1 }
                }
            } else { return false }
            if i == s.count - 1 { return iw2 == 0 }
        }
        return true
    }
}
