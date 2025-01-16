class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        [(nums1, nums2), (nums2, nums1)]
            .flatMap { $0.1.count % 2 == 1 ? $0.0 : [] }
            .reduce(0, ^)
    }
}
