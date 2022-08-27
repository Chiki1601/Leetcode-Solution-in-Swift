class Solution {
        func setZeroes(_ matrix: inout [[Int]]) {
        let row = matrix.count
        let col = matrix[0].count
        
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 0 {
                    setMax(&matrix, i, j)
                }
            }
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] != 0 {
                    resetMax(&matrix, i, j)
                }
            }
        }
    }

    
    func setMax(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        for i in 0..<matrix.count { 
            let val = matrix[i][col]
            matrix[i][col] = val == 0 ? 0 : Int.max
        }
        
        for j in 0..<matrix[0].count {
            let val = matrix[row][j]
            matrix[row][j] = val == 0 ? 0 : Int.max
        }
    }
    
    
    func resetMax(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        let val = matrix[row][col]
        if val == Int.max { matrix[row][col] = 0 }
    }
    
}
