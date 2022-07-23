class Solution {
    
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        var res = 0
        var stack = [Int]()
        
        stack.append(Int.max)
        for v in arr {
            while stack.last! <= v {
                let mid = stack.removeLast()
                res += mid * min(stack.last!, v)
            }
            stack.append(v)
        }        
        
        while stack.count > 2 { res += stack.removeLast() * stack.last! }
        return res
    }
}
