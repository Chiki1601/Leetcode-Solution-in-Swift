class Solution {
    
    func countAndSay(_ n: Int) -> String {
        func helper(_ s: String, _ n: Int) -> String {
            guard n > 1 else { return s }
            var string = ""
            var prev: Character?
            var count: Int = 1

            for c in s {
                if let prev = prev {
                    if c == prev {
                        count += 1
                    } else {
                        string += "\(count)\(prev)"
                        count = 1
                    }
                }
                prev = c
            }
            string += "\(count)\(prev!)"
            return helper(string, n - 1)
        }

        return helper("1", n)
    }
    
}
