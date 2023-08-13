class Solution {


    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var count = [Int](repeating: 0, count: nums.count + 10)
        var res = [[Int]]()

        for a in nums {
            if res.count <= count[a] {
                res.append([])
            }
            res[count[a]].append(a)
            count[a] += 1
        }

        return res
    }
}
