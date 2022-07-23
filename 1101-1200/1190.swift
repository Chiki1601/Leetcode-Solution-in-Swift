class Solution {
    
    func reverseParentheses(_ s: String) -> String {
        var s = Array(s)
        var stack = [Character]()
        
        while !s.isEmpty {
            let last = s.removeFirst()
            if last == Character(")") {
                var temp = [Character]()
                while stack.last != Character("(") { temp.append(stack.removeLast()) }
                stack.removeLast()
                stack.append(contentsOf: temp)
            } else {
                stack.append(last)
            }
        }
        
        return String(stack)
    }
    
}
