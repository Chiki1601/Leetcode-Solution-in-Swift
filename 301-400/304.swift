
class NumMatrix {

      private var sums:[[Int]] = []


    init(_ matrix: [[Int]]) {
        for i in 0..<matrix.count {
            sums.append(Array(repeating: 0, count: matrix[i].count))
            for j in 0..<matrix[i].count {
                var sum = 0
                if i > 0 { sum += sums[i-1][j] }
                if j > 0 { sum += sums[i][j-1] }
                if i > 0 && j > 0 { sum -= sums[i-1][j-1] }
                sum += matrix[i][j]
                sums[i][j] = sum
            }
        }
    }
    
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var ans = sums[row2][col2]
        
        if row1 > 0 { ans -= sums[row1-1][col2] }
        if col1 > 0 { ans -= sums[row2][col1-1] }
        if col1 > 0 && row1 > 0 { ans += sums[row1-1][col1-1] }
        return ans
    }
    
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
