class Solution {
   
    private let mod = 1_000_000_007


    func countGoodNumbers(_ n: Int) -> Int { quickPower(20, n >> 1) * (n % 2 == 0 ? 1 : 5) % mod }

    private func quickPower(_ bottom: Int,_ exponent: Int) -> Int {
        guard exponent > 1 else { return exponent == 0 ? 1 : bottom }
        let half = quickPower(bottom, exponent >> 1) % mod
        let ans = half % mod * half % mod
        
        if exponent % 2 == 0 { return ans } 
        else { return bottom * ans % mod }
    }
}
