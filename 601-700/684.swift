class Solution {
    var adj: [[Int]] = []
    var pos: [String: Int] = [:]
    var isVis: [Bool] = []
    var max = -1
    
    func dfs(_ i: Int, parent: Int) {
        isVis[i] = true
        for j in adj[i] {
            if !isVis[j] {
                dfs(j, parent: i)
            } else if j != parent, let edgePos = pos["\(i),\(j)"], max < edgePos {
                max = edgePos
            }
        }
    }
    
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        adj = Array(repeating: [Int](), count: n + 1)
        
        for (index, edge) in edges.enumerated() {
            let edgeKey = "\(edge[0]),\(edge[1])"
            pos[edgeKey] = index
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }
        
        for i in 1...n {
            isVis = Array(repeating: false, count: n + 1)
            dfs(i, parent: -1)
        }
        
        return edges[max]
    }
}
