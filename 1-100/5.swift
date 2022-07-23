class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return s }
        var string = Array(s)
        let count = string.count
        var max1 = 0
        var index1 = 0
        var max2 = 0
        var index2 = -1

        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i - j < 0 || i + j > count-1) { break }
                if (string[i  - j] != string[i + j]) { break }
                max1 = max1 > tmp ? max1 : tmp
                index1 = max1 > tmp ? index1 : i
                tmp += 1
            }
        }

        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i - j < 0 || i + j + 1 > count - 1) { break }
                if (string[i - j] != string[i + j + 1]) { break }
                tmp += 1
                max2 = max2 > tmp ? max2 : tmp
                index2 = max2 > tmp ? index2 : i
            }
        }

        if ((max1 * 2 + 1) >= max2 * 2) {
            let start = s.index(s.startIndex, offsetBy: index1 - max1)
            let end = s.index(s.startIndex, offsetBy: index1 + max1 + 1)
            return String(s[start..<end])
        } 
        else {
            let start = s.index(s.startIndex, offsetBy: index2 - max2 + 1)
            let end = s.index(s.startIndex, offsetBy: index2 + max2 + 1)
            return String(s[start..<end])
        }  
    }
}
