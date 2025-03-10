class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        var blackCount = 0
        var ans = Int.max
        let blocksArray = Array(blocks)

        for i in 0..<blocksArray.count {
            if i >= k && blocksArray[i - k] == "B" {
                blackCount -= 1
            }
            if blocksArray[i] == "B" {
                blackCount += 1
            }
            ans = min(ans, k - blackCount)
        }

        return ans
    }
}
