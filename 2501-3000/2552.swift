class Solution {
    func countQuadruplets(_ nums: [Int]) -> Int {
        nums.indices.reduce(into: (
            result: 0, 
            dp: nums.indices.reduce(into: [[0]]) { dp, i in
                    dp.append([0])
                    nums.indices.forEach { j in
                        dp[i+1].append(dp[i+1].last! + (nums[j] < i+1 ? 1 : 0))
                    }
                }
        )) { data, j in
            for k in (j+1)..<nums.count where nums[j] > nums[k] {
                let iCount = data.dp[nums[k]][j]
                let lCount = (nums.count - nums[j]) + data.dp[nums[j]][k+1] - k
                data.result += iCount * lCount
            }
        }.result
    }
}
