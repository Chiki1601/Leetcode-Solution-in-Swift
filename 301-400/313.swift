class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var uglyNums = Array(repeating: Int.max, count: n)
        var indexs = Array(repeating: 0, count: primes.count)
        uglyNums[0] = 1
        
        for i in 0..<n {
            for j in 0..<primes.count {
                uglyNums[i] = min(uglyNums[i], primes[j] * uglyNums[indexs[j]])
            }

            for j in 0..<primes.count {
                while primes[j] * uglyNums[indexs[j]] <= uglyNums[i] { indexs[j] += 1}
            }
        }
        
        return uglyNums.last!
    }

}
