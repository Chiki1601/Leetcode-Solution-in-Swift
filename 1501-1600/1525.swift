class Solution {
    
    func numSplits(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        var ans = 0
        var prefix =  [Int]()
        var set = Set<Character>()
        var suffix = [Int](repeating: 0, count: s.count)
        
        for ch in s {
            if !set.contains(ch) { set.insert(ch) }
            prefix.append(set.count)
        }
        
        set = []
        var i = s.count - 1

        for ch in s.reversed() {
            if !set.contains(ch) { set.insert(ch) }
            suffix[i] =  set.count
            i -= 1
        }

        for i in 0..<(s.count - 1) where prefix[i] == suffix[i + 1] { ans += 1 }
        return ans
    }
   
}
