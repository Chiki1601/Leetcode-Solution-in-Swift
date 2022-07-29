class Solution {
   
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var rules = [Int: [Int]]()
        var chars = [Int]()
        var ans = [String]()

        for (i, c) in pattern.unicodeScalars.enumerated() {
            let v = Int(c.value) - 97
            if var indexs = rules[v] {
                indexs.append(i)
                rules[v] = indexs
            } else {
                chars.append(v)
                rules[v] = [i]
            }
        }

        for word in words {
            var table = Array(repeating: -1, count: 26)
            var index = -1
            var flag = true
            
            for (i, c) in word.unicodeScalars.enumerated() {
                let v = Int(c.value) - 97
                if table[v] == -1 {
                    index += 1
                    if index >= chars.count { flag = false; break }
                    table[v] = chars[index]

                }
                guard let indexs = rules[table[v]],
                    indexs.contains(i),
                    index < chars.count else { flag = false; break }
            }
            if flag { ans.append(word) }
        }

        return ans
    }

}
