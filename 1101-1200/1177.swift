class Solution {
    
    func canMakePaliQueries(_ s: String, _ queries: [[Int]]) -> [Bool] {
        let baseCharacter: Character = "a"
        var masks = [Int](repeating: 0, count: s.count + 1)
        var results = [Bool](repeating: false, count: queries.count)

        for (i, character) in s.enumerated() {
            masks[i + 1] = masks[i] ^ (1 << (character.asciiValue! - baseCharacter.asciiValue!))
        }

        for (i, query) in queries.enumerated() {
          let lhs = query[0]
          let rhs = query[1]
          let availableSubstitutions = query[2]
          let requiredSubstitutions = (masks[rhs + 1] ^ masks[lhs]).nonzeroBitCount / 2
          results[i] = requiredSubstitutions <= availableSubstitutions
        }

        return results
    }

}
