class Solution {
    func containsPattern(_ arr: [Int], _ m: Int, _ k: Int) -> Bool {
        var arrCopy = arr


        func check(_ nums: [Int]) -> Bool {
            let prefix = nums[0..<m]
            var cnt = 0
            var numsCopy = nums
            while numsCopy.count >= m {
                let temp = numsCopy[0..<m]
                if temp == prefix {
                    cnt += 1
                    if cnt >= k { return true }
                    numsCopy.removeFirst(m)
                } else { return false }
            }
            return false
        }

        while arrCopy.count >= m * k{
            guard !check(arrCopy) else { return true }
            arrCopy.removeFirst()
        }
        return false
    }
}
