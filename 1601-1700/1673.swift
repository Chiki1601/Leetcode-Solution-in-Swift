class Solution {
      func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
        var tmp = [Int]()
        var count = nums.count - k
        
        for num in nums {
            while !tmp.isEmpty, let last = tmp.last, last > num, count > 0 {
                tmp.removeLast()
                count -= 1
            }
            tmp.append(num)
        }
        
        return Array(tmp[0..<k])
    }
}
