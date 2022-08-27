class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res: [String] = []
        var i = 0
        
        while i < words.count {
            var j = i
            var tmpLength = 0
            
            while j < words.count {
                tmpLength += words[j].count + ((j > i) ? 1 : 0)
                
                if tmpLength <= maxWidth { j += 1 } 
                else {
                    res.append(stringWithWords(words, maxWidth, i, j))
                    break
                }
            }
            
            if j == words.count {
                res.append(stringWithWords(words, maxWidth, i, j))
            }
            i = j
        }
        
        return res
    }


    func stringWithWords(_ words: [String], _ maxWidth: Int, _ i: Int, _ j: Int) -> String {
        var length = 0
        var string = ""
        
        func space(_ n: Int) -> String {
            var string = ""
            for _ in 0..<n { string += " " }
            return string
        }
        
        func space(_ index: Int, _ count: Int, _ length: Int, _ maxWidth: Int, _ isLast: Bool) -> String {
            if isLast { return index == count - 1 ? space(maxWidth - length - count + 1) : " " }
            if count == 1 { return space(maxWidth - length) }
            if index == count - 1 { return "" }
            return space((maxWidth - length) / (count - 1)) + (index < ((maxWidth - length) % (count - 1)) ? " " : "")
        }

        for k in i..<j { length += words[k].count }
        
        for k in i..<j {
            string += words[k] + space(k - i, j - i, length, maxWidth, j == words.count)
        }
        
        return string
    }
}
