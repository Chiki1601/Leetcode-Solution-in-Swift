class Solution {
     func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()

        for ch in s { dict[ch, default: 0] += 1 }
        
        for ch in t {
            guard let val = dict[ch] else { return false }
            dict[ch] = val > 1 ? val - 1 : nil
        }
        
        return dict.isEmpty
    }

}
