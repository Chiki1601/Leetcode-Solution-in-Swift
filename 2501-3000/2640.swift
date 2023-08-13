class Solution {


    func findPrefixScore(_ nums: [Int]) -> [Int] {
        var m = 0
        var conver = [Int]()
        for x in nums {
            m = max(m, x)
            conver.append(x + m)
        }

        var prefixSum = 0
        return conver.map { score in
            prefixSum += score
            return prefixSum
        }
    }
}
