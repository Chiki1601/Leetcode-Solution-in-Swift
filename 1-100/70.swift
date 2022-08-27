class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 { return 1 }

        var first = 1
        var second = 1
        var third = 0
        
        for _ in 2...n {
            third = first + second
            first = second
            second = third
        }

        return second
    }
}
