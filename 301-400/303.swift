
class NumArray {

     private var sums: [Int] = []

    
    init(_ nums: [Int]) {
        var sum: Int = 0
        for n in nums {
            sum += n
            sums.append(sum)
        }
    }
    
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        let vi = i == 0 ? sums[i] : sums[i] - sums[i-1]
        let ans = sums[j] - sums[i] + vi

        return ans
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
