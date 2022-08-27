class Solution {
      
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }

        let m = matrix.count
        let n = matrix[0].count

        var left = 0
        var right = m * n - 1

        while left <= right {
            let mid = left + (right - left) / 2

            let el = matrix[mid / n][mid % n]
            guard el != target else { return true }

            if el < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }
}
