class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let n = mat.count
        let m = mat[0].count
        
        for i in 0..<n { sortDiagonal(in: &mat, i: i, j: 0, n: n, m: m) }
        for j in 0..<m { sortDiagonal(in: &mat, i: 0, j: j, n: n, m: m) }
        
        return mat
    }
    
    
    private func sortDiagonal(in mat: inout [[Int]], i: Int, j: Int, n: Int, m: Int) {
        var diagonal = [Int]()
        var i = i
        var j = j
        
        while i < n, j < m {
            diagonal.append(mat[i][j])
            i += 1
            j += 1
        }
        
        diagonal.sort()
        
        while i > 0, j > 0 {
            i -= 1
            j -= 1
            mat[i][j] = diagonal.removeLast()
        }
    }

}
