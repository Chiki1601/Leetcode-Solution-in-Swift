class Solution {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        let lookup = words.enumerated().reduce(into: [[Character]:Int]()) { $0[Array($1.1)] = $1.0 }
        let lookupHashed = lookup.reduce(into: [Int:Int]()) { $0[Array($1.key.reversed()).hashValue] = $1.value }
        let lookupKeySizes = Set(lookup.keys.map { $0.count })
        var result = [[Int]]()
        
        func isValidPalindrome(_ word:[Character], _ front:Int, _ back:Int) -> Bool {
            for (a,b) in zip(front...back, (front...back).reversed()) where word[a] != word[b] || a >= b { return a >= b }
            return true // will never get here
        }
        
        func validPrefixes(_ word:[Character]) -> [Int] {
            var result = [Int]()
            for i in word.indices where lookupKeySizes.contains(i) && isValidPalindrome(word, i, word.count-1) {
                if let otherIndex = lookupHashed[word[0..<i].hashValue] {
                    result.append(otherIndex)
                }
            }
            return result
        }

        func validSuffixes(_ word:[Character]) -> [Int] {   
            var result = [Int]()
            for i in word.indices where lookupKeySizes.contains(word.count-i-1) && isValidPalindrome(word, 0, i) {
                if let otherIndex = lookupHashed[word[(i+1)..<word.count].hashValue] {
                    result.append(otherIndex)
                }
            }
            return result
        }
        
        for (word, index) in lookup {
            if let otherIndex = lookupHashed[word.hashValue], index != otherIndex {
                result.append([index, otherIndex])
            }
            
            for suffix in validSuffixes(word) where suffix != index {
                result.append([suffix, index])
            }
            
            for prefix in validPrefixes(word) where prefix != index {
                result.append([index, prefix])
            }
        }
        return result
    }
}
