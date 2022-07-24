class Solution {
     func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var rank = [Int](repeating: 0, count: 101)
        var ans = [Int](repeating: 0, count: nums.count)

        for num in nums { rank[num] += 1 }
        for i in 1..<rank.count { rank[i] += rank[i - 1] }

        for (i, num) in nums.enumerated() {
            if num == 0 {
                ans[i] = 0
            } else {
                ans[i] = rank[num - 1]
            }
        }

        return ans
    }
}
