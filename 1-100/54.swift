class Solution {
  
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let count = (matrix.count + 1) / 2 
        let row = matrix.count
        let col = matrix[0].count
        var res: [Int] = []
        
        for i in 0..<count {
            
            for j in i..<col - i - 1 {
                let x = i
                let y = j
                res.append(matrix[x][y])
                if res.count == row * col { break }
            }
            
            for j in i..<row - i - 1 {
                let x = j
                let y = col - i - 1
                res.append(matrix[x][y])
                if res.count == row * col { break }
            }
            
            for j in i..<col - i - 1 {
                let x = row - i - 1
                let y = col - j - 1
                res.append(matrix[x][y])
                if res.count == row * col { break }
            }
            
            for j in i..<row - i - 1 {
                let x = row - j - 1
                let y = i
                res.append(matrix[x][y])
                if res.count == row * col { break }
            }
            
            if res.count == row * col { break }
        }
        
        if res.count == row * col - 1 {
            res.append(matrix[row / 2][col / 2])
        }
        
        return res
    }
}
