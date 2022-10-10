class Solution {
    func breakPalindrome(_ p: String) -> String {
        String((0...p.count/2).reduce(into: (Array(p), true)) { guard $0.1 && $1 < $0.0.count/2 else { if $0.0.count < 2 {$0.0 = []} else if $0.1 { $0.0[$0.0.count-1] = "b";}; return }; if $0.0[$1] != "a" {$0.0[$1] = "a"; $0.1 = false}}.0)
    }
}
