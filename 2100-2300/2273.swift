class Solution {
    func removeAnagrams(_ words: [String]) -> [String] {
        words
            .reduce(into: []) {
                if $0.last?.sorted() != $1.sorted() {
                    $0.append($1)
                }
            }
    }
}
