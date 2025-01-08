class Solution {
    func countPrefixSuffixPairs(_ l: [String]) -> Int {
        var cnt = 0
        let n = l.count
        for i in 0..<n {
            for j in i+1..<n {
                if l[j].hasPrefix(l[i]) && l[j].hasSuffix(l[i]) {
                    cnt += 1
                }
            }
        }
        return cnt
    }
}
