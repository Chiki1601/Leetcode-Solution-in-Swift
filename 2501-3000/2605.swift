class Solution {


    func minNumber(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var freq = Array(repeating: 0, count: 10)

        for num in nums1 {
            freq[num] += 1
        }

        for num in nums2 {
            freq[num] += 1
        }

        var k = 2
        var ans = 0
        let mn1 = nums1.min()!
        let mn2 = nums2.min()!

        for i in 1...9 {
            if freq[i] == 2 {
                return i
            }
        }

        let minNumber = min(mn1, mn2)
        let maxNumber = max(mn1, mn2)
        return minNumber * 10 + maxNumber
    }
}
