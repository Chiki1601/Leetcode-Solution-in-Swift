class Solution {
    func minimumIndex(_ nums: [Int]) -> Int {
        func findDominantElement(_ arr: [Int]) -> Int? {
            var candidate: Int?
            var count = 0

            // Boyer-Moore Majority Vote algorithm
            for num in arr {
                if count == 0 {
                    candidate = num
                    count = 1
                } else if num == candidate {
                    count += 1
                } else {
                    count -= 1
                }
            }

            guard let candidate = candidate else { return nil }
            let totalCount = arr.filter { $0 == candidate }.count
            return totalCount > arr.count / 2 ? candidate : nil
        }

        guard let dominant = findDominantElement(nums) else { return -1 }

        var leftCount = 0
        let totalDominantCount = nums.filter { $0 == dominant }.count

        for i in 0..<nums.count - 1 {
            if nums[i] == dominant {
                leftCount += 1
            }

            let leftSubarrayCount = leftCount
            let rightSubarrayCount = totalDominantCount - leftCount

            if leftSubarrayCount > (i + 1) / 2 &&
               rightSubarrayCount > (nums.count - i - 1) / 2 {
                return i
            }
        }

        return -1
    }
}
