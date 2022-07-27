class Solution {
      let map: [Character: Int] = [
        "a": 11,
        "b": 13,
        "c": 17,
        "d": 19,
        "e": 23,
        "f": 29,
        "g": 31,
        "h": 37,
        "i": 39,
        "j": 41,
        "k": 43,
        "l": 47,
        "m": 53,
        "n": 59,
        "o": 61,
        "p": 67,
        "q": 71,
        "r": 73,
        "s": 79,
        "t": 83,
        "u": 89,
        "v": 97,
        "w": 101,
        "x": 103,
        "y": 107,
        "z": 109
    ]


    func hash(_ s: [Character]) -> Int {
        var hashvalue: Int = 0
        for c in s {  hashvalue += map[c]! }
        return hashvalue
    }


    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let s = Array(s)
        let words = words.map({ Array($0) })
        let sLength = s.count
        let wLength = words.reduce(0, { $0 + $1.count })
        
        if sLength < wLength { return [] }
        
        let wHash = words.reduce(0, { $0 + hash($1) })
        let wSubLength = words.count > 0 ? words[0].count : 0
        var invalidStringList: [[Character]] = []
        var validStringList: [[Character]] = []
        var res: [Int] = []
        var i = 0
        var sHash = 0

        while i <= sLength - wLength {
            if i == 0 {
                sHash = hash(Array(s[i..<i+wLength]))
            } else {
                sHash += map[s[i + wLength - 1]]! - map[s[i - 1]]!
            }
            if wHash == sHash {
                let subString = Array(s[i..<i + wLength])
                if invalidStringList.contains(subString) {
                    i += 1
                    continue
                }
                if validStringList.contains(subString) {
                    res.append(i)
                    i += 1
                    continue
                }
                var is_match = true
                var words = words
                for j in 0..<words.count {
                    let word = Array(s[(i + j * wSubLength)..<(i + (j + 1) * wSubLength)])
                    if !words.contains(word) {
                        is_match = false
                        break
                    } else {
                        let index = words.firstIndex(of: word)!
                        words.remove(at: index)
                    }
                }
                if is_match {
                    res.append(i)
                    validStringList.append(subString)
                } else {
                    invalidStringList.append(subString)
                }
            }
            i += 1
        }
        return res
    }

}
