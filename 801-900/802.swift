class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var ind = [Int](repeating: 0, count: n)
        var adj = [[Int]](repeating: [], count: n)

        for (i, nodes) in graph.enumerated() {
            for node in nodes {
                adj[node].append(i)
                ind[i] += 1
            }
        }

        var q = (0..<n).filter { ind[$0] == 0 }

        var safe = [Bool](repeating: false, count: n)
        var idx = 0
        while idx < q.count {
            safe[q[idx]] = true
            for nbr in adj[q[idx]] {
                ind[nbr] -= 1
                if ind[nbr] == 0 { q.append(nbr) }
            }
            idx += 1
        }

        return (0..<n).filter { safe[$0] }
    }
}
