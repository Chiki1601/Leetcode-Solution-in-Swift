class Solution{ 
    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var ans = 0

        for num in nums {
            let tmp = ans
            ans = max(prev + num, ans)
            prev = tmp
        }

        return ans
    }
}
