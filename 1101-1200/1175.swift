class Solution {
     func numPrimeArrangements(_ n: Int) -> Int {
        var primeCount = 0
        var res = 1
        
        for i in 1...n where isPrime(i) { primeCount += 1 }
        if primeCount > 1 { for i in 1...primeCount { res = (res * i) % 1000000007 } }
        for i in 1...(n - primeCount) { res = (res * i) % 1000000007 }
        
        return res % 1000000007
    }

    
    func isPrime(_ n: Int) -> Bool {
        if n == 1 { return false }
        for i in 2..<Int(n / 2) + 1 where n % i == 0 { return false }
        return true
    }
}
