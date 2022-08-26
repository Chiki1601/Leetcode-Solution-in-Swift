class Solution {
    
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let a = count(N)
        for i in 0..<31 {
            guard a == count(1 << i) else { continue }
            return true
        }
        return false
    }
    

    private func count(_ n: Int) -> [Int] {
        var n = n
        var ans = [Int](repeating: 0, count: 10)
        
        while n > 0 {
            ans[n % 10] += 1
            n /= 10
        }
        return ans
    }

}
