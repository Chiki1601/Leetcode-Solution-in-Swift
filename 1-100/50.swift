class Solution {
      func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }

        var x = x
        var n = n

        if n < 0 {
            n = -n
            x = 1 / x
        }
        return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
    }

}
