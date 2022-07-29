class Solution {
      func isMatch(_ s: String, _ p: String) -> Bool {
        var regular = ""
        var last: Character = " "
        
        for c in p {
            if c == "?" {
                regular += "."
            } else if c == "*" && last != "*" {
                regular += ".*"
            } else {
                regular += String(c)
            }
            last = c
        }
        return regularExpressionMatching(s, regular)
    }


    func regularExpressionMatching(_ s: String, _ p: String) -> Bool {
        var string = Array(s)
        var chars: [Character] = []
        var marks : [Bool] = []
        var isMark: Bool = false
        var list = [[-1, -1, 1]] // [start, end, is need to add next start]
        var max = Int.min


        func nextRange(_ list: [[Int]], _ char: Character, _ mark: Bool) -> [[Int]] {
            var res = Set<[Int]>()
            for range in list {
                let lower = range[0] + range[2]
                let upper = range[1] + 1
                for i in lower...upper {
                    if mark {
                        var j = i
                        var count = 0
                        while j < string.count {
                            if char == string[j] || char == "." {
                                j += 1
                                count += 1
                            } else {
                                break
                            }
                        }
                        j = i + (count > 0 ? count - 1 : 0) 
                        if count > 0 {
                            res.insert([i, j, 0])
                        } else {
                            res.insert(range)
                        }
                    } else {
                        if i < string.count && (char == string[i] || char == ".") {
                            res.insert([i, i, 1])
                        }
                    }
                }
            }

            return Array(res)
        }

        for (_, c) in p.enumerated().reversed() {
            if c == "*" {
                isMark = true
            } else {
                chars.insert(c, at: 0)
                marks.insert(isMark, at: 0)
                isMark = false
            }
        }

        for (index, c) in chars.enumerated() {
            let mark = marks[index]
            list = nextRange(list, c, mark)
        }
        for rang in list { max = max > rang[1] ? max : rang[1] }        
        return max == string.count - 1
    }

}
