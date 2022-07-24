class Solution {
  func getMaximumConsecutive(_ coins: [Int]) -> Int {
        var ans = 0

        for coin in coins.sorted() {
            guard coin <= ans + 1 else { break }
            ans += coin
        }
        return ans + 1
    }
}
