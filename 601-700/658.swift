class Solution {
      func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {


        func binarySearch() -> Int {
            var l = 0
            var r = arr.count - 1

            while l + 1 < r {
                let mid = (l + r) / 2
                if arr[mid] == x {
                    return mid
                } else if arr[mid] > x {
                    r = mid
                } else {
                    l = mid
                }
            }
            return r
        }

        guard arr.count > 0 else { return [] }

        if arr[0] > x { return Array(arr[0..<min(k, arr.count)]) }
        if arr.last! < x { return Array(arr[max(arr.count - k, 0)..<arr.count]) }

        let index = binarySearch()
        var l = max(0, index - k)
        var r = min(index + k, arr.count - 1)

        while r - l != k - 1 {
            if x - arr[l] > arr[r] - x {
                l += 1
            } else {
                r -= 1
            }
        }

        return Array(arr[l...r])
    }
    
}
