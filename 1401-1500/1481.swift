class Solution {
        func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var map = [Int: Int]()        
        for num in arr { map[num] = (map[num] ?? 0) + 1 }
        var result = map.count
        var m = k

        for count in map.values.sorted() where m > 0 && count <= m {
            result -= 1
            m -= count
        }
        
        return result
    }
}
