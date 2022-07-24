class Solution {
      func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        if a >= b && a >= c {
            if b >= c {
                return helper(max: (a, "a"), other: (b, "b"), another: (c, "c"))
            } else {
                return helper(max: (a, "a"), other: (c, "c"), another: (b, "b"))
            }
        }

        if b >= a && b >= c {
            if a >= c {
                return helper(max: (b, "b"), other: (a, "a"), another: (c, "c"))
            } else {
                return helper(max: (b, "b"), other: (c, "c"), another: (a, "a"))
            }
        }

        if c >= a && c >= b {
            if a >= b {
                return helper(max: (c, "c"), other: (a, "a"), another: (b, "b"))
            } else {
                return helper(max: (c, "c"), other: (b, "b"), another: (a, "a"))
            }
        }

        return ""
    }


    func helper(max: (count: Int, str: String), other: (count: Int, str: String), another: (count: Int, str: String)) -> String {
        var arrays: [[String]] = []
        var tmp: [String] = []
        var j = 0
        var isDiscard = false


        func handle(tuple: (count: Int, str: String)) {
            for _ in 0 ..< tuple.count {
                arrays[j].append(tuple.str)
                j += 1
                if j >= arrays.count { j = 0 }
            }
        }

        for _ in 0 ..< max.count {
            tmp.append(max.str)
            if tmp.count == 2 { arrays.append(tmp); tmp = [] }
        }

        if !tmp.isEmpty { arrays.append(tmp) }

        handle(tuple: other)
        handle(tuple: another)

        return arrays.filter {
            if $0.count <= 2 && isDiscard == true { return false }
            if $0.count <= 2 { isDiscard = true }
            return true
        }.map { $0.joined() }.joined()
    }

}
