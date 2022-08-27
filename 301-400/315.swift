class Solution {
       typealias Pair = (idx: Int, val: Int)

    
    func countSmaller(_ nums: [Int]) -> [Int] {
        var pairs: [Pair] = []
        var temp: [Pair] = Array(repeating: (0, 0), count: nums.count)
        var map: [Int: Int] = [:]       // [index: count], record the smaller count of nums[index]
        for (idx, val) in nums.enumerated() { pairs.append((idx, val)) }
        
        mergeSort(&pairs, 0, nums.count - 1, &temp, &map)
        
        var result = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count { result[i] = map[i] ?? 0 }
        return result
    }
    
    
    func mergeSort(_ pairs: inout [Pair], _ left: Int, _ right: Int, _ temp: inout [Pair], _ map: inout [Int: Int]) {
        if left >= right { return }
        
        let mid = left + (right - left) / 2
        mergeSort(&pairs, left, mid, &temp, &map)
        mergeSort(&pairs, mid + 1, right, &temp, &map)
        
        mergeAndCount(&pairs, left, mid, right, &temp, &map)
    }
    
    
    func mergeAndCount(_ pairs: inout [Pair], _ left: Int, _ mid: Int, _ right: Int, _ temp: inout [Pair], _ map: inout [Int: Int]) {
        guard left < right else { return }
        
        for i in left...right { temp[i] = pairs[i] }

        var i = left
        var j = mid + 1
        
        for k in left...right {
            if j > right || (i <= mid && temp[i].val <= temp[j].val) {
                // every time an element from left side merged, we update the smaller count of it
                // the smaller elements are those from right side and already been merged
                map[temp[i].idx, default: 0] += j - mid - 1
                pairs[k] = temp[i]
                i += 1
            } else {
                pairs[k] = temp[j]
                j += 1
            }
        }
    }
}
