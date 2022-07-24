class Solution {
       func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var distanceMap = Array(repeating: Array(repeating: 10001, count: n), count: n)
        var answer = 0
        var minValue = Int.max

        for (_, yelement) in edges.enumerated(){    
            let from = yelement[0]
            let to = yelement[1]
            let weight = yelement[2]
            distanceMap[from][to] = weight
            distanceMap[to][from] = weight
        }
        
        for node in 0..<n { distanceMap[node][node] = 0 }
        
        for middlePoint in 0..<n{
            for startPoint in 0..<n{
                for endPoint in 0..<n{
                    if distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint] < distanceMap[startPoint][endPoint]{
                        distanceMap[startPoint][endPoint] = distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint]
                    }
                }
            }
        }
        
        for (yindex , yelement) in distanceMap.enumerated() {
            var cnt = 0

            for (xindex , xelement) in yelement.enumerated() where xindex != yindex && xelement <= distanceThreshold { cnt += 1  }
            
            if minValue >= cnt {
                minValue = cnt
                answer = yindex
            }
        }
        
        return answer
    }
}
