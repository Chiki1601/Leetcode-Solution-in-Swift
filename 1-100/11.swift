class Solution {
      func maxArea(_ height: [Int]) -> Int {
        var start = 0
        var end = height.count - 1
        var ans = 0
        
        while start < end {
            ans = max(ans, min(height[start], height[end]) * (end - start))
            if height[start] < height[end] { start += 1 } else { end -= 1 }
        }
        
        return ans
    }
}
