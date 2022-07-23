class Solution {
    
    func alphabetBoardPath(_ target: String) -> String {
        let boardArray = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"].map { Array($0).map { String($0) } }
        let targetArray = Array(target).map { String($0) }
        var currentTargetIndex = 0
        var queue = [(Int, Int, String)]()
        var visitedSet = Set<String>()
        var result = ""
        
        queue.append((0, 0, ""))
        visitedSet.insert(boardArray[0][0])
        
        while queue.isEmpty == false {
            var (row, col, path) = queue.removeFirst()
            
            if boardArray[row][col] == targetArray[currentTargetIndex] {
                path += "!"
                currentTargetIndex += 1
                visitedSet.removeAll()
                queue.removeAll()
                visitedSet.insert(boardArray[row][col])
                queue.append((row, col, path))
                
                if currentTargetIndex >= targetArray.count {
                    result = path
                    break
                } else { continue }
            }
            
            for neighbor in [ (-1,0,"U"), (0,1,"R"), (1,0,"D"), (0,-1,"L") ] {
                let (newRow, newCol, direction) = (row + neighbor.0, col + neighbor.1, neighbor.2)
                if newRow < boardArray.count &&
                    newRow >= 0 &&
                    newCol < boardArray[newRow].count &&
                    newCol >= 0 &&
                    !visitedSet.contains(boardArray[newRow][newCol]) {
                        
                        visitedSet.insert(boardArray[newRow][newCol])
                        queue.append((newRow, newCol, path + direction))
                }
            }
        }

        return result
    }
}
