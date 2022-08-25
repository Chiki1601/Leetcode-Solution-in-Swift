class Solution {
   
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.count >= ransomNote.count else { return false }

        var dict = [Character: Int]()

        for mag in magazine { dict[mag, default: 0] += 1 }

        for ran in ransomNote {
            guard let val = dict[ran] else { return false }
            dict[ran] = val == 1 ? nil : val - 1
        }

        return true
    }
}
