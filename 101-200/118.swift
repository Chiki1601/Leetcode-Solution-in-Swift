class Solution {
  func generate(_ numRows: Int) -> [[Int]] {
    var result: [[Int]] = []
    for row in 0..<numRows {
        let count = row + 1
        
        var array: [Int] = []
        for column in 0..<count {
            if column == 0 || column == count - 1 {
                array.append(1)
            } else {
                let preArray = result[row - 1]
                array.append(preArray[column - 1] + preArray[column])
            }
        }
        result.append(array)
    }
    return result
}
}
