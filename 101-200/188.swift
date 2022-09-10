class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {

        let M = prices.count

        var memo = [Int:Int]()
        func dfs(_ idx: Int, _ remainTransitionTime: Int, _ hasBought:Int) -> Int {
            guard remainTransitionTime > 0 else {return 0}
            guard idx < M else {return 0}
            let key = (remainTransitionTime << 20 ) | (idx << 10) | hasBought
            guard nil == memo[key] else {return memo[key] ?? 0}
            var ans = Int.min

            ans = max(ans, dfs(idx + 1, remainTransitionTime, hasBought))

            if 0 == hasBought  {
                ans = max(ans, -prices[idx] + dfs(idx + 1, remainTransitionTime, 1))
            }

            if 1 == hasBought {
                ans = max(ans, prices[idx] + dfs(idx + 1, remainTransitionTime - 1, 0))
            }

            if 1 == hasBought {
                ans = max(ans, dfs(idx + 1, remainTransitionTime - 1, 1))
            }
            memo[key] = ans
            return ans
        }
        return dfs(0, k, 0)
    }
}
