class Solution {
    func distinctNames(_ ideas: [String]) -> Int {
        var set = Set<String>()
        for i in 0..<ideas.count {
            set.insert(ideas[i])
        }
        var mapArr = [[Int]](repeating: [Int](repeating: 0, count: 26), count: 26)
        var map = [Character: [String]]()
        for i in 0..<ideas.count {
            if map[ideas[i].first!] == nil {
                map[ideas[i].first!] = [String]()
            }
            map[ideas[i].first!]?.append(ideas[i])
        }
        for i in 0..<26 {
            for j in 0..<26 {
                for idea in map[Character(UnicodeScalar(i + 97)!)] ?? [String]() {
                    if Character(UnicodeScalar(i + 97)!) != Character(UnicodeScalar(j + 97)!) {
                        let s = String(UnicodeScalar(j + 97)!) + idea[idea.index(idea.startIndex, offsetBy: 1)...]
                        if !set.contains(s) { mapArr[i][j] += 1 }
                    }
                }
            }
        }
        var ans = 0
        for i in 0..<26 {
            for j in 0..<26 {
                ans += mapArr[i][j] * mapArr[j][i]
            }
        }
        return ans
    }
}
