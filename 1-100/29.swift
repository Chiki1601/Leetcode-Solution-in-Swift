class Solution {
        func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let is_negtive = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
        let dividend = abs(dividend)
        let divisor = abs(divisor)
        var tmp = divisor
        var rem = dividend
        var res = 0

        while rem >= tmp {
            var count = 0
            while rem >= tmp {
                count += 1
                tmp *= 10
            }
            tmp = divisor
            rem = rem - Int(pow(10, Double(count-1))) * tmp
            if rem >= 0 {
                res += Int(pow(10, Double(count-1)))
            }
        }
        
        if (is_negtive && res >= 2147483648) { res = 2147483648 }
        if (!is_negtive && res >= 2147483647) { res = 2147483647 }
        return is_negtive ? -1 * res : res
    }
    
}
