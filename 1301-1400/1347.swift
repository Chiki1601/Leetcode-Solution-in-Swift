class Solution {
      func minSteps(_ s: String, _ t: String) -> Int {
        var minSteps = 0
        var mapping = [Character: Int]()
        
        for char in s {
            if let exists = mapping[char] { mapping[char] = exists + 1 } else { mapping[char] = 1 }
        }
        
        for char in t {
            if let exists = mapping[char] {
                mapping[char] = exists - 1
                if exists - 1 == 0 { mapping.removeValue(forKey: char) }
            }
            else { minSteps += 1 }
        }
        
        return minSteps
    }
}
