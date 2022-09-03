class Solution {
       
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        guard N > 1 else { return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
        var ans = [Int]()

        for num in 1..<10 { dfs(N - 1, num, K, &ans) }
        return ans
    }

    
    private func dfs(_ n: Int, _ num: Int, _ k: Int, _ ans: inout [Int]) {
        guard n > 0 else { ans.append(num); return }
        var nextDigits = [Int]()
        let tailDigits = num % 10

        nextDigits.append(tailDigits + k)

        if k != 0 { nextDigits.append(tailDigits - k) }

        for nextDigit in nextDigits {
            guard nextDigit >= 0, nextDigit < 10 else { continue }
            dfs(n - 1, num * 10 + nextDigit, k, &ans)
        }
    }
}
