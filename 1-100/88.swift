class Solution {
   
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastA = m - 1
        var lastB = n - 1
        var curr = nums1.count - 1

        while lastA >= 0, lastB >= 0 {
            if nums1[lastA] >= nums2[lastB] {
                nums1[curr] = nums1[lastA]
                lastA -= 1
            } else {
                nums1[curr] = nums2[lastB]
                lastB -= 1
            }
            curr -= 1
        }

        while lastB >= 0 {
            nums1[curr] = nums2[lastB]
            lastB -= 1
            curr -= 1
        }
    }
}
