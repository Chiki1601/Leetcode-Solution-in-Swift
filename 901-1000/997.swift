class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        guard N > 0 else {
            return -1
        }
        
        var candidates = Set(Array(1...N))
        var trusted = [Int:Int]()
        
        for t in trust{
            let a = t[0]
            let b = t[1]
            
            candidates.remove(a)
            trusted[b, default: 0] += 1
        }
        
        for candidate in candidates{
            if trusted[candidate, default: 0] == N-1{
                return candidate
            }
        }
        
        return -1
    }
}
