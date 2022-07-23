class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegtive: Bool = x < 0
        var val = isNegtive ? -x : x
        var nums: [Int] = []
        let max: Double = pow(2, 31)
        var res: Int = 0
        
        while val > 0 {
            nums.append(val % 10)
            val = val / 10
        }
        
        for num in nums { res = 10 * res + num }
        res = isNegtive ? -res : res
        if res < -Int(max) || res > Int(max)  - 1 { res = 0 }
        return res
    }
}
