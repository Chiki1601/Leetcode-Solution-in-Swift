class Solution {
      func addBinary(_ a: String, _ b: String) -> String {
        guard !a.isEmpty else { return b }
        guard !b.isEmpty else { return a }

        var carry = 0
        let a = Array(a)
        let b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var ans = [Int]()

        while i >= 0 || j >= 0 || carry != 0 {
            var sum = carry
            if i >= 0, a[i] == "1" { sum += 1 }
            if j >= 0, b[j] == "1" { sum += 1 }

            let digit = sum % 2
            carry = sum / 2
            ans.append(digit)

            i -= 1
            j -= 1
        }

        return ans.map { String($0) }.reversed().joined()
    }
}
