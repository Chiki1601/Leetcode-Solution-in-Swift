class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var cache: [Int : [Int]] = [:]
        var ans = [Int]()
        for num in arr2 { cache[num] = [] }
        
        for num in arr1 {
            if cache[num] != nil {
                cache[num]!.append(num)
            } else {
                ans.append(num)
            }
        }
        
        ans.sort(by: < )
        
        for i in stride(from: arr2.count - 1, to: -1, by: -1) { ans.insert(contentsOf: cache[arr2[i]]!, at: 0) }
        return ans
    }
}
