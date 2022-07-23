class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var rows: [[Character]] = []
        var res = ""

        for _ in 0..<numRows { rows.append([]) }

        for (i, c) in s.enumerated() {
            let index = i % (numRows + numRows - 2)
            if index < numRows {
                rows[index].append(c)
            } else {
                rows[index - 2 * (index - numRows + 1)].append(c)
            }
        }

        for row in rows {
            for c in row { res += String(c) }
        }

        return res
    }
}
