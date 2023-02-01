class Solution {
        func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        return (str1 + str2 != str2 + str1) ? "" :
            String(str1.prefix(gcd(str1.count, str2.count)))
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        let large = max(a,b)
        let small = min(a,b)
        return large%small == 0 ? small : gcd(small, large%small)
    }

	
}
