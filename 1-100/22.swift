class Solution {
     func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []


        func backtrack(_ path: [String], _ target: Int) {
            var path = path
            var count = 0

            if path.count == n * 2 {
                var string = ""
                for s in path { string += s }
                res.append(string)
                return
            }

            for c in path where c == "(" { count += 1 }
            for c in ["(", ")"] {
                if (c == "(" && count >= n) || (c == ")" && path.count - count >= count)  { continue }
                path.append(c)
                backtrack(path, target - 1)
                path.remove(at: path.count - 1)
            }
        }

        backtrack([], n * 2)
        return res
    }

}
