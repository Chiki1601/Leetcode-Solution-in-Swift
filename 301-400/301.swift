class Solution {
     func removeInvalidParentheses(_ s: String) -> [String] {
        var level = Set<String>()
        level.insert(s)
        
        while true {
            let valid = level.filter({ isValid($0) })
            if valid.count > 0 { return Array(valid) }
            
            var nextLevel = Set<String>()
            for s in level {
                for i in 0..<s.count {
                    if "()".contains(Array(s)[i]) {
                        let str = s.prefix(i) + s.suffix(s.count - i - 1)
                        nextLevel.insert(String(str))
                    }
                }
            }

            level = nextLevel
        }
    }
    
    
    private func isValid(_ s: String) -> Bool {
        var leftMinusRight = 0
        for i in Array(s) {
            if i == "(" { leftMinusRight += 1 }
            else if i == ")" { leftMinusRight -= 1 }
            
            if leftMinusRight < 0 { return false }
        }
        return leftMinusRight == 0
    }
}
