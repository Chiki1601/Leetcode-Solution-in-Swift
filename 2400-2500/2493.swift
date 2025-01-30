final class Solution {
    func magnificentSets(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            let u = edge[0] - 1
            let v = edge[1] - 1
            graph[u].append(v)
            graph[v].append(u)
        }

        var seen = Array(repeating: 0, count: n)
        var groups = [[Int]]()

        for i in 0..<n where seen[i] == 0 {
            seen[i] = 1
            var stack = [i]
            var group = [i]

            while let u = stack.popLast() {
                for v in graph[u] {
                    if seen[v] == 0 {
                        seen[v] = seen[u] + 1
                        stack.append(v)
                        group.append(v)
                    } else if seen[u] % 2 == seen[v] % 2 {
                        return -1
                    }
                }
            }
            groups.append(group)
        }

        func bfs(_ start: Int) -> Int {
            var visited = Array(repeating: false, count: n)
            var queue = [start]
            visited[start] = true
            var depth = 0

            while !queue.isEmpty {
                for _ in 0..<queue.count {
                    let u = queue.removeFirst()
                    for v in graph[u] where !visited[v] {
                        visited[v] = true
                        queue.append(v)
                    }
                }
                depth += 1
            }
            return depth
        }

        var result = 0
        for group in groups {
            let maxDepth = group.map { bfs($0) }.max() ?? 0
            result += maxDepth
        }

        return result
    }
}
