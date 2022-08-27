class Solution {
   
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        var n = num

        while n * n > num { n = (n + num / n) / 2 }
        return n * n == num
    }

}
