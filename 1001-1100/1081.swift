class Solution {
      func smallestSubsequence(_ s: String) -> String {
        var stack = [Character]()
        var seen = Set<Character>()
        var lastOccurrence = [Character: Int]()
        var ans = ""

        for (i, ch) in s.enumerated() { lastOccurrence[ch] = i }

        for (i, ch) in s.enumerated() {
            guard !seen.contains(ch) else { continue }
            while !stack.isEmpty,
                  let last = stack.last,
                  ch < last,
                  lastOccurrence[last, default: 0] > i {
                seen.remove(last)
                stack.removeLast()
            }
            seen.insert(ch)
            stack.append(ch)
        }

        for ch in stack { ans = "\(ans)\(ch)" }
        return ans
    }
    
}
