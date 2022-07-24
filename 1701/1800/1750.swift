class Solution {
    
    func minimumLength(_ s: String) -> Int {
        var curS = [Character](s)
        while curS.count > 1 && curS.first! == curS.last!{
            let targetChar = curS[0]
            let n = curS.count
            var l = 0
            while l < n && curS[l] == targetChar { l += 1 }
            guard l != curS.count else { return 0 }
            var r = n - 1
            while r >= 0 && curS[r] == targetChar { r -= 1 }
            curS.removeFirst(l)
            curS.removeLast(n - 1 - r)
        }
        return curS.count
    }
}
