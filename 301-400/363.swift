class Solution {
   func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        guard m > 0 else { return 0 }
        
        let n = matrix[0].count
        guard n > 0 else { return 0 }
        
        var res = Int.min
        for left in 0 ..< n {
            var sum = [Int](repeating: 0, count: m)
            for right in left ..< n {
                for j in 0 ..< m { sum[j] += matrix[j][right] }
                var prefixSum = [Int]()
                prefixSum.append(0)
                var cur = 0
                for num in sum {
                    cur += num
                    let loc = bisectLeft(prefixSum, cur - k)
                    if prefixSum.count > loc {
                        res = max(res, cur - prefixSum[loc])
                    }
                    inorder(&prefixSum, cur)
                }
            }
        }
        return res
    }
    

    private func bisectLeft(_ arr: [Int], _ num: Int) -> Int {
        guard arr.count > 0 else { return 0 }
        if num < arr[0] { return 0 }
        if num > arr[arr.count - 1] { return arr.count }
        var left = 0
        var right = arr.count

        while left < right {
            let middle = left + (right - left)/2
            if arr[middle] < num {
                left = middle + 1
            } else {
                right = middle
            }
        }
        return left
    }
    

    private func inorder(_ arr: inout [Int], _ num: Int) {
        let index = bisectLeft(arr, num)
        arr.insert(num, at: index)
    }

}
