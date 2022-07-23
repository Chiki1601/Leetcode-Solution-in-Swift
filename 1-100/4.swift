class Solution {
   func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let total = nums1.count + nums2.count
        var index = 0
        var index1 = 0
        var index2 = 0
        var mergedArray: [Int] = []
        var res: Double = 0

        while total > 0 && index <= total / 2 {
            if index1 < nums1.count && index2 < nums2.count {
                if nums1[index1] < nums2[index2] {
                    mergedArray.append(nums1[index1])
                    index1 += 1
                } else {
                    mergedArray.append(nums2[index2])
                    index2 += 1
                }
            } else if index1 < nums1.count && index2 >= nums2.count {
                mergedArray.append(nums1[index1])
                index1 += 1
            } else {
                mergedArray.append(nums2[index2])
                index2 += 1
            }
            index += 1
        }

        if total > 0 {
            if total % 2 == 1 {
                res = Double(mergedArray[total / 2])
            } else {
                res = (Double(mergedArray[total / 2]) + Double(mergedArray[total / 2 - 1])) / 2
            }
        }

        return res
    }
}
