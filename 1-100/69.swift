class Solution {
  
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        if x < 4 { return 1 }
        
        var left = 0
        var right = (x + 1) / 2
        var mid = (left + right) / 2
        
        while left < right {
            if mid * mid > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
            
            mid = (left + right) / 2
        }
        
        return left * left > x ? left - 1 : left
    }
    
}
