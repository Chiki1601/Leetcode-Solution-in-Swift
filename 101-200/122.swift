class Solution {
      func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        
        var ans = 0
        
        for i in 1..<prices.count {
            guard prices[i] > prices[i - 1] else { continue }
            ans += prices[i] - prices[i - 1]
        }
        
        return ans
    }

}
