class Solution {
  
    func largestMerge(_ word1: String, _ word2: String) -> String {
        var w1 = word1
        var w2 = word2
        var ans = ""
        
        while !w1.isEmpty || !w2.isEmpty {
            if w1 < w2 {
                ans.append(w2.removeFirst())
            } else {
                ans.append(w1.removeFirst())
            }
        }
        return ans
    }
    
}
