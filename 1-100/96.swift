class Solution {
      func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var map: [Int] = [1, 1]
        
        for i in 2...n {
            var tmp = 0
            
            for j in 0..<i {
                tmp += map[j] * map[i - j - 1]
            }
            map.append(tmp)
        }
        
        return map[n]
    }

}
