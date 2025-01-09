class Solution {
    func prefixCount(_ w: [String], _ p: String) -> Int {
        w.filter{$0.hasPrefix(p)}.count
    }
}
