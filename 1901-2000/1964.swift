class Solution {
     func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        let n = obstacles.count
        if n == 1 { return [1] }
        var res = Array(repeating: 1, count: n)
        var arr = [obstacles[0]]

        for i in 1..<n {
            let index = find(obstacles[i], arr)
            res[i] = index + 1
            if index == arr.count { arr.append(obstacles[i]) } 
            else { arr[index] = obstacles[i] }
        }

        return res
    }


    private func find(_ target: Int, _ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] <= target { left = mid + 1 } 
            else { right = mid }
        }
        return arr[left] <= target ? left + 1 : left
    }
}
