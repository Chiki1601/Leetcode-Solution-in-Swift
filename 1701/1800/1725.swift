class Solution {
   
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var maxLen = 0
        var squares: [Int] = []
        var ans = 0
        
        for edges in rectangles {
            let edge = min(edges[0], edges[1])
            if edge >= maxLen { squares.append(edge) }
            maxLen = max(maxLen, edge)
        }
        
        for square in squares where maxLen == square { ans += 1 }
        return ans
    }

}
