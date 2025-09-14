class Solution {
    private func isVowel(_ c: Character) -> Bool {
        return "aeiou".contains(c)
    }
    private func maskVowels(_ s: String) -> String {
        var out = ""
        for ch in s {
            out.append(isVowel(ch) ? "a" : String(ch))
        }
        return out
    }

    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        var exact = Set<String>(wordlist)
        var lowerMap = [String:String]()
        var vowelMap = [String:String]()

        for w in wordlist {
            let wl = w.lowercased()
            if lowerMap[wl] == nil { lowerMap[wl] = w }
            let masked = maskVowels(wl)
            if vowelMap[masked] == nil { vowelMap[masked] = w }
        }

        var ans = [String]()
        ans.reserveCapacity(queries.count)
        for q in queries {
            if exact.contains(q) {
                ans.append(q); continue
            }
            let ql = q.lowercased()
            if let found = lowerMap[ql] {
                ans.append(found); continue
            }
            let qmask = maskVowels(ql)
            ans.append(vowelMap[qmask] ?? "")
        }
        return ans
    }
}
