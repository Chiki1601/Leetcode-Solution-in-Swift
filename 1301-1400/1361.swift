class Solution {
     func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var count = 0
        var root = -1
        var degrees = [Int](repeating:0, count: n)
        var visited = [Bool](repeating: false, count: n)

        for i in 0..<n {
            if leftChild[i] != -1 { degrees[leftChild[i]] += 1 }
            if rightChild[i] != -1 { degrees[rightChild[i]] += 1 }
        }
        
        for i in 0..<n {
            guard degrees[i] <= 1 else { return false }
            if degrees[i] == 0 {
                count += 1
                root = i
                guard count <= 1 else { return false }
            }
        }

        guard root != -1 else { return false }
        
        // DFS
        func dfs(_ node: Int) -> Bool {
            guard !visited[node] else { return false }
            visited[node] = true
            if leftChild[node] != -1 {
                guard dfs(leftChild[node]) else { return false }
            }
            if rightChild[node] != -1 {
                guard dfs(rightChild[node]) else { return false }
            }
            return true
        }
        
        guard dfs(root) else { return false }
        return !visited.contains(false)
    }

}
