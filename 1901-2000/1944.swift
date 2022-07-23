class Solution {
    func canSeePersonsCount(_ heights: [Int]) -> [Int] {
        let m = heights.count
        var ans = [Int](repeating: 0, count: m)
        var stack = [Int]()

        for i in 0..<m {
            while !stack.isEmpty && heights[stack.last!] <= heights[i] { ans[stack.removeLast()] += 1 }
            if !stack.isEmpty { ans[stack.last!] += 1 }
            stack.append(i)
        }
        return ans
    }
    
}
