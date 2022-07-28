class Solution {
      func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isInvalid(_ box: [Character]) -> Bool {
            var chars: [Character] = []
            for c in box where c != "." {
                if chars.contains(c) { return true } else { chars.append(c) }
            }
            return false
        }

        for i in 0..<9 {
            if isInvalid(board[i]) { return false }
            if isInvalid(board.map({ $0[i] })) { return false }
            let col = (i % 3) * 3
            let row = (i / 3) * 3
            let box = Array(board[row][col..<col + 3]) + Array(board[row + 1][col..<col + 3]) + Array(board[row + 2][col..<col + 3])
            if isInvalid(box) { return false }
        }
        return true
    }
    
}
