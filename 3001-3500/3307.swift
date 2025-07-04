class Solution {
    func kthCharacter(_ k: Int, _ operations: [Int]) -> Character {
        var i = k
        var transforms = 0
        while i > 1 {
            let n = floor(log2(Double(i-1)))
            i -= Int(pow(2.0, n))
            if operations[Int(n)] == 1 { transforms += 1 }
        }
        return Character(UnicodeScalar((transforms%26)+97)!)
    }
}
