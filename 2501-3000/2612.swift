class Solution {

    func minReverseOperations(_ n: Int, _ p: Int, _ banned: [Int], _ k: Int) -> [Int] {
        var out = Array(repeating: -1, count: n)

        for node in banned {
            out[node] = -2
        }

        var nodes = [p]
        var depth = 0
        out[p] = depth
        let step = k - 1
        var nextNode2s = Array(0...(n - 1)).map { $0 + 2 }

        while !nodes.isEmpty {
            depth += 1
            var newNodes = [Int]()

            for node1 in nodes {
                let loReverseStart = max(node1 - step, 0)
                let hiReverseStart = min(node1, n - k)
                let loNode2 = 2 * loReverseStart + k - 1 - node1
                let hiNode2 = 2 * hiReverseStart + k - 1 - node1

                let postHiNode2 = hiNode2 + 2
                var node2 = loNode2

                while node2 <= hiNode2 {
                    let nextNode2 = nextNode2s[node2]
                    nextNode2s[node2] = postHiNode2

                    if node2 >= 0 && node2 < n && out[node2] == -1 {
                        newNodes.append(node2)
                        out[node2] = depth
                    }

                    node2 = nextNode2
                }
            }

            nodes = newNodes
        }

        for i in 0..<n {
            if out[i] == -2 {
                out[i] = -1
            }
        }

        return out
    }
}
