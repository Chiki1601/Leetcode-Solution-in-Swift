class Solution {
   
    func stringMatching(_ words: [String]) -> [String] {
        let sorted = words.sorted { $0.count < $1.count }
        var result = [String]()

        for i in (0..<sorted.count) {
            for j in (i + 1..<sorted.count) where sorted[j].contains(sorted[i]) { result.append(sorted[i]); break }
        }

        return result
    }

}
