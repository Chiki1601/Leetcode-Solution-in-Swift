class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        // To maximize its score, the second robot can either:
        // - travel along the first row (and moving down at the very end), or
        // - travel along the second row (after moving down in the first step)
        //
        // 222222222222    or    2
        //            2          222222222222
        // 
        // Depending on the path taken by the first robot, the second robot
        // will choose the first or second row in order to maximize its score.
        //
        // We will consider all the paths taken by the first robot.

        // Initial path of the first robot:
        //
        // 1
        // 11111111111111

        var (row1Score, row2Score) = (grid[0][1...].reduce(0, +), 0)
        var res = max(row1Score, row2Score)

        // Path of the first robot:
        //
        //       i
        // 1111111
        //       1111111

        for i in 1..<grid[0].count {
            row1Score -= grid[0][i]
            row2Score += grid[1][i - 1]
            res = min(res, max(row1Score, row2Score))
        }

        return res
    }
}
