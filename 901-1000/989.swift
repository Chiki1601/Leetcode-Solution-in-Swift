class Solution {
        func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var res = [Int]()
        var index = A.count - 1
        var carry = 0
        var K = K
        while K != 0 || index >= 0{
            
            var digit = 0
            if K != 0 {
                digit += K % 10
                K /= 10
            }
            if index >= 0 {
                digit += A[index]
                index -= 1
            }
            digit += carry
            carry = digit / 10
            
            res.insert(digit % 10, at: 0)
            
        }
        if carry != 0 {
            res.insert(carry, at: 0)
        }
        
        return res
    }
}
