class Solution {
      func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        var m = q
        var n = p

        while m % 2 == 0, n % 2 == 0 {
            m /= 2
            n /= 2
        }

        if m % 2 == 0, n % 2 == 1 { return 0 }
        if m % 2 == 1, n % 2 == 1 { return 1 }
        if m % 2 == 1, n % 2 == 0 { return 2 }

        return -1
    }
}
