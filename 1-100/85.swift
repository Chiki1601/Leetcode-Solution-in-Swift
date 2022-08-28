class Solution {
      func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0 { return 0 }
        var max = 0

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let area = helper(matrix, i, j, matrix.count,  matrix[0].count)
                max = max > area ? max : area
            }
        }
        
        return max
    }


    func helper(_ matrix: [[Character]], _ i: Int, _ j: Int, _ maxI: Int, _ maxJ: Int) -> Int {
        if matrix[i][j] == "0" || maxI == i || maxJ == j { return 0 }
        var x = -1
        var y = -1

        loop: 
        for row in i..<maxI {
            for col in j..<maxJ {
                if matrix[row][col] == "0" {
                    x = row
                    y = col
                    break loop
                }
            }
        }
        
        if x >= 0 {
            return max(helper(matrix, i, j, x, maxJ), helper(matrix, i, j, maxI, y))
        } else {
            return (maxI - i) * (maxJ - j)
        } 
    }
    
}
