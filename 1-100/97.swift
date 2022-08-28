class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var dp: [String: Bool] = [:]
        
        
        func is_interleave(_ chs1: [Character], _ chs2: [Character], _ chs3: [Character], _ i: Int, _ j: Int, _ k: Int) -> Bool {
            if let v = dp["\(i)-\(j)-\(k)"] { return v }
            var v1 = false
            var v2 = false

            if i >= chs1.count && j >= chs2.count && k >= chs3.count { return true }
            
            if i < chs1.count && chs1[i] == chs3[k] {
                v1 = is_interleave(chs1, chs2, chs3, i + 1, j, k + 1)
            }
            
            if j < chs2.count && chs2[j] == chs3[k] {
                v2 = v1 || is_interleave(chs1, chs2, chs3, i, j + 1, k + 1)
            }
            
            dp["\(i)-\(j)-\(k)"] = v1 || v2
            return v1 || v2
        }
        
        if s1.count + s2.count != s3.count { return false } 
        else {
            return is_interleave(Array(s1), Array(s2), Array(s3), 0, 0, 0)
        }
    }

}
