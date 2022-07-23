class Solution {
       let boardRange = 0 ..< 8

        let isWithinBoard: ([Int]) -> Bool = { position in
            let hasValidX = boardRange.contains(position[0])
            let hasValidY = boardRange.contains(position[1])
            return hasValidX && hasValidY
        }

        let queens = Set(queens)

        for generateNextPosition in nextPositionGenerators {
            var position = generateNextPosition(king)
            while isWithinBoard(position) {
                if queens.contains(position) { attackingQueens.append(position); break }
                position = generateNextPosition(position)
            }
        }

        return attackingQueens
    }
}
