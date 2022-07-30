class Solution {
     func getPermutation(_ n: Int, _ k: Int) -> String {
        var digitals: [Int] = []
        var res: String = ""
        var val = k
        var m = n

        for i in 1...n { digitals.append(i) }

        while res.count < n && val > 0 {
            let i = Int(ceil(Double(val) / Double(permutation(m - 1))))
            res += "\(digitals[i-1])"
            print(i, digitals)
            digitals.remove(at: i - 1)
            val -= (i - 1) * permutation(m - 1)
            m -= 1
        }
        return res
    }


    func permutation(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var res = 1
        for i in 1...n { res *= i }
        return res
    }
}
