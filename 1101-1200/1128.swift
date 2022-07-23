class Solution {
    
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var freq: [Int] = Array(repeating: 0, count: 100)
        var count = 0
        
        dominoes.forEach {
            let newDominoe = $0.sorted()
            let num = newDominoe[0] * 10 + newDominoe[1]
            count += freq[num]
            freq[num] += 1
        }
        
        return count
    }
}
