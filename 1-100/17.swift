class Solution {
      func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        var res: [String] = []
        let map: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]


        func backtrack(_ path: [Character], _ input: [Character]) {
            if path.count >= digits.count { res.append(String(path)); return }
            let index = path.count
            let digit = input[index]
            var path = path   
            for c in map[digit]! {
                path.append(c)
                backtrack(path, input)
                path.remove(at: path.count - 1)
            }
        }

        backtrack([], Array(digits))

        return res
    }
}
