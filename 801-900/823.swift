class Solution {
      func numFactoredBinaryTrees(_ A: [Int]) -> Int {
        var dp = [Int: Int]()
        let mod = Int(pow(10.0, 9.0)) + 7
        let sortedA = A.sorted()
        
        for (i, a) in sortedA.enumerated() {
            var num = 0
            for m in sortedA[0..<i] {
                if m * m > a { break }
                if a % m > 0 { continue }
                let n = a / m
                num = num + dp[m]! * (dp[n] ?? 0) * (m != n ? 2 : 1) % mod
            }
            dp[a] = num + 1
        }
        
        return dp.reduce(0, { (res, arg1) -> Int in
            let (_, v) = arg1
            return v + res
        }) % mod
    }
    
  
}
