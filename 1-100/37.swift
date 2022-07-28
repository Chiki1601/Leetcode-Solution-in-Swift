class Solution {
       func solveSudoku(_ board: inout [[Character]]) {
        func backtrack(_ path: [Character], _ input: [[Character]], _ index: Int) {
            if path.count == 81 {
                if isValidSudoku(input) { board = input }
                return
            }
            let x = index / 9
            let y = index % 9
            let chars = available(input, x, y)
            var path = path
            var input = input
            let tmp = input[x][y]

            for c in chars {
                path.append(c)
                input[x][y] = c
                backtrack(path, input, index + 1)
                input[x][y] = tmp
                path.remove(at: path.count - 1)
            }
        }

        //  1.
        var loop = false
        repeat {
            var tmp = false
            for x in 0..<9 {
                for y in 0..<9 {
                    if board[x][y] != "." { continue }
                    tmp = tmp || fill(&board, x, y)
                }
            }
            loop = tmp
        } while loop
        
        //  2.
        backtrack([], board, 0)
    }


    func fill(_ board: inout [[Character]], _ x: Int, _ y: Int) -> Bool {
        let chars = available(board, x, y)
        if chars.count == 1 {
            board[x][y] = chars[0]
            return true
        } else {
            return false
        }
    }


    func available(_ board: [[Character]], _ x: Int, _ y: Int) -> [Character] {
        if board[x][y] != "." { return [board[x][y]] }

        // [[0, 1, 2],
        //  [3, 4, 5],
        //  [6, 7, 8],]
        let j = (x / 3) * 3 + (y / 3)   
        var res: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var c: Character

        for i in 0..<9 {
            c = board[x][i]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }
        
            c = board[i][y]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }
            
            let x = (j / 3) * 3 + i / 3
            let y = (j % 3) * 3 + i % 3
            
            c = board[x][y]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }
        }

        return res
    }


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
