class Solution {
      func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        let n = heights.count
        var ans = 0
        
        for i in 0..<n {
            while let curHeight = stack.last, heights[curHeight] >= heights[i] {
                stack.removeLast()
                let curWidth = stack.last ?? -1
                ans = max(ans, heights[curHeight] * (i - curWidth - 1))
            }
            stack.append(i)
        }
        
        while !stack.isEmpty {
            let curHeight = stack.removeLast()
            let curWidth = stack.last ?? -1
            ans = max(ans, heights[curHeight] * (n - curWidth - 1))
        }
        
        return ans
    }

}
