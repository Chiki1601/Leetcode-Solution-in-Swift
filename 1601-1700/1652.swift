class Solution {
     func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        guard k != 0 else { return [Int](repeating: 0, count: code.count) }
        let n = code.count
        var ans = [Int]()
        let codeCopy = code + code
        var prefix = codeCopy
        
        for i in 1..<(2 * n) { prefix[i] += prefix[i - 1] }
        if k > 0 {
            for i in 0..<n { ans.append(prefix[i + k] - prefix[i]) }
        } else {
            for idx in n..<(n * 2) { ans.append(prefix[idx - 1] - prefix[idx + k - 1]) }
        }
        return ans
    }
}
