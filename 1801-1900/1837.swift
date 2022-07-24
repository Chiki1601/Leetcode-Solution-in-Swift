class Solution {
    
    func sumBase(_ n: Int, _ k: Int) -> Int {
        var ans = 0
        var N = n

        while N > 0 {
            ans += N % k
            N /= k
        }
        return ans
    }
}
