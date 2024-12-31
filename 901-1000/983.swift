class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        guard days.count > 0 else { return 0 }
        let days = Set(days)
        //days are in range 1 to 365 (or we can do max of days or days.last!)
        /**
            lets say dp[i] - denotes the min dollars need to travel till i days

            dp[i] = min {
                dp[i-1] + costs[0],
                dp[i - 7] + costs[1],
                dp[i - 30] + costs[2]
            }
        **/
        var dp = Array(repeating: 0, count: 366)
        dp[0] = 0 //no cost to cover 0 days

        for i in 1...365 {
            if days.contains(i) == false {
                //if we are not travelling, then still there is no cost for travel
                dp[i] = dp[i-1]
                continue
            }

            dp[i] = min(
                dp[i - 1] + costs[0],
                dp[max(0, i - 7)] + costs[1],
                dp[max(0, i - 30)] + costs[2]
            )
        }

        return dp[365]
    }
}
