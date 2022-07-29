class Solution {
   
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var dict = [Int: Int]()
        var ans = [[Int]]()
        var comb = [Int]()

        for num in nums { dict[num, default: 0] += 1 }
        backtrack(&comb, nums.count, &dict, &ans)
        return ans
    }


    private func backtrack(_ comb: inout [Int], _ n: Int, _ dict: inout [Int: Int], _ ans: inout [[Int]]) {
        guard comb.count != n else { ans.append(comb); return }

        for (_, el) in dict.enumerated() {
            guard el.value != 0 else { continue }
            comb.append(el.key)
            dict[el.key, default: 0] -= 1
            backtrack(&comb, n, &dict, &ans)
            comb.removeLast()
            dict[el.key] = el.value
        }
    }

}
