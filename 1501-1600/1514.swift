class Solution {
   
    var visited = [Int]()
    var maxProb: Double = 0

    
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var path = [[(Int, Double)]](repeating: [(Int, Double)](), count: n)
        var probs = [Double](repeating: 0, count: edges.count)
        var queue = [(Int, Double)]()
        
        for i in 0..<edges.count {
            let edge = edges[i]
            path[edge[0]].append((edge[1], succProb[i]))
            path[edge[1]].append((edge[0], succProb[i]))
        }
        
        queue.append((start, 1.0))

        while queue.count > 0 {
            let (vertex, prob) = queue.removeFirst()
            if path[vertex].count == 0 { return 0 }

            for (next, nextProb) in path[vertex] {
                let p = prob * nextProb
                if next >= probs.count { return 0 }
                if probs[next] >= p { continue }
                queue.append((next, p))
                probs[next] = p
            }
        }
        
        return probs[end]
    }


    func maxProbability_fail(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {        
        for _ in 0..<n  { visited.append(0) }
        dfs(start, n, edges, succProb, end, 1)
        return maxProb
    }

    
    func dfs(_ vertex:Int, _ n:Int, _ edges: [[Int]], _ succProb: [Double],_ end:Int,_ last:Double)-> Double {
        var prob: Double = 0
        let edgeN = edges.count
        
        visited[vertex] = 1
        
        for i in 0..<edgeN {    
            var next = -1
            if edges[i][0] == vertex { next = edges[i][1] }
            if edges[i][1] == vertex { next = edges[i][0] }
            if next != -1 && visited[next] == 0 {
                prob = succProb[i]
                if next == end {
                    maxProb = max(maxProb, prob*last)
                    return prob * last
                } 
                else { dfs(next, n, edges, succProb, end,prob) }
            }
        }

        return prob
    }
}
