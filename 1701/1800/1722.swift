class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        var tree = [Int: Set<Int>]()
        for edge in allowedSwaps {
            tree[edge[0], default: []].insert(edge[1])
            tree[edge[1], default: []].insert(edge[0])
        }
        let n = source.count
        var visited = [Bool](repeating: false, count: n)
        var ans = 0

        
        func dfs(_ node: Int, _ indices: inout [Int]) {
            visited[node] = true
            indices.append(node)
            guard let children = tree[node] else { return }
            for next in children {
                guard !visited[next] else { continue }
                dfs(next, &indices)
            }
        }

        for i in 0..<n {
            guard !visited[i] else { continue }
            var indices = [Int]()
            dfs(i, &indices)
            var counter = [Int: Int]()
            for idx in indices {
                counter[source[idx], default: 0] += 1
                counter[target[idx], default: 0] -= 1
            }
            var curCnt = 0
            for (_, cnt) in counter { curCnt += abs(cnt) }
            ans += (curCnt >> 1)
        }
        return ans
    }
}
