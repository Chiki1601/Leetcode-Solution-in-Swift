class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        var n = n
        var neighbors = Array(repeating: Set<Int>(), count: n)
        var inDegrees = Array(repeating: 0, count: n)
        var leaves = [Int]()

        for edge in edges {
            neighbors[edge[0]].insert(edge[1])
            neighbors[edge[1]].insert(edge[0])
            inDegrees[edge[0]] += 1
            inDegrees[edge[1]] += 1
        }

        for (node, degree) in inDegrees.enumerated() {
            guard degree == 1 else { continue }
            leaves.append(node)
        }

        while n > 2 {
            n -= leaves.count

            var newLeaves = [Int]()
            for leaf in leaves {
                guard let neighbor = neighbors[leaf].first else { continue }

                neighbors[neighbor].remove(leaf)
                inDegrees[leaf] -= 1
                inDegrees[neighbor] -= 1

                guard inDegrees[neighbor] == 1 else { continue }
                newLeaves.append(neighbor)
            }

            leaves = newLeaves
        }

        return leaves
    }
}
