class Solution {
     func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        var res: [[Int]] = []


        func backtrack(_ path: [Int], _ input: [Int], _ target: Int, _ index: Int) {
            var path = path
            var last: Int?

            for (i, num) in input.enumerated() {
                if let last = last, last == num { continue }
                if i <= index { continue }
                if num == target {
                    res.append(path + [num])
                    break
                }
                if num > target { break }
                if num < target {
                    path.append(num)
                    backtrack(path, input, target - num, i)
                    path.remove(at: path.count - 1)
                }
                last = num
            }
        }
        backtrack([], sorted, target, -1)
        return res
    }
}
