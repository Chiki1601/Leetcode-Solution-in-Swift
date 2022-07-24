class Solution {
      func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        var arrWithLuckkyNum = [Int]()
        var r = 0
        let m = matrix.count
        var minVal = 0
        var maxVal = 0
        var i = 0
        var j = 0

        while r < m {
            minVal = findMin(matrix[r])
            i = findPositionMinVal(matrix[r], minVal)
            maxVal = minVal
            j = 0
            while j < m {
                if matrix[j][i] > maxVal { maxVal = matrix[j][i]; break }
                j += 1
            }
            if j == m && maxVal == minVal { arrWithLuckkyNum.append(maxVal) }
            r += 1
        }

        return arrWithLuckkyNum
    }


    private func findMin(_ arr: [Int]) -> Int {
        var i = 0
        var minVal = arr[i]
        while i < arr.count {
            if arr[i] < minVal { minVal = arr[i] }
            i += 1
        }
        return minVal
    }


    private func findPositionMinVal(_ arr: [Int], _ minVal: Int) -> Int {
        var i = 0
        while i < arr.count {
            if arr[i] == minVal { return i }
            i += 1
        }
        return i
    }
}
