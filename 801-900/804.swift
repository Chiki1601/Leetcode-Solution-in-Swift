class Solution {
   func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var ans = Set<String>()

        for word in words {
            var tmp = ""
            for ch in word {
                guard let morseCh = morse[ch] else { continue }
                tmp = "\(tmp)\(morseCh)"
            }
            guard tmp != "" else { continue }
            ans.insert(tmp)
        }

        return ans.count
    }


    private let morse: [Character: String] = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--.."
    ]

}
