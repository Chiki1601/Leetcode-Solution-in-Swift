class Solution {
   func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        var orray = [Int](repeating: 0, count: m)
        var output = [Int](repeating: 0, count: queries.count)
        
        for i in 1...m { orray[i - 1] = i - 1 }
        
        for (index, query) in queries.enumerated() {
            output[index] = orray[query - 1]
            if orray[query - 1] != 0 {
                for i in 0..<orray.count where orray[i] < orray[query - 1] { orray[i] += 1 }
                orray[query - 1] = 0
            }
        }

        return output
    }
}
