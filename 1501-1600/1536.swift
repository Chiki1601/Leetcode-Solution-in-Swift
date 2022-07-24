class Solution {
     func minSwaps(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 1 { return 0 }
        var right = Array(repeating: 0, count: n) // right[i] means grid[i]'s right zero count
        var swap = 0

        for i in 0..<n {
            var j = n - 1
            while j >= 0, grid[i][j] == 0 { j -= 1 }
            right[i] = n - j - 1
        }

        for i in 0..<n {
            if right[i] < n - i - 1 {
                var j = i
                while j < n, right[j] < n - i - 1 { j += 1 }
                if j == n { return -1 } // cannot find any number >= n - i - 1
                let val = right.remove(at: j) // swap right[j] with j - 1, j - 2, ... until i + 1
                right.insert(val, at: i)
                swap += j - i
            }
        }

        return swap
    }
}
