class Solution {
      func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
        let asciiA = Character("a").asciiValue!
        var memoB = Array(repeating: 0, count: 26)
        var temp = Array(repeating: 0, count: 26)
        var isUniversal = true
        var res = [String]()

        for b in B {
            temp = Array(repeating: 0, count: 26)
            for c in b { temp[Int(c.asciiValue! - asciiA)] += 1 }
            for i in 0..<26 { memoB[i] = max(memoB[i], temp[i]) }
        }

        for a in A {
            temp = Array(repeating: 0, count: 26)
            for c in a { temp[Int(c.asciiValue! - asciiA)] += 1 }

            isUniversal = true
            for i in 0..<26 where temp[i] < memoB[i] { isUniversal = false; break }

            if isUniversal { res.append(a) }
        }

        return res
    }

}
