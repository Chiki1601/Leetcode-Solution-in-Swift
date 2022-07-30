class Solution {
   func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[Int]] = []
        
        
        func backtarck(_ path: [Int]) {
            if path.count == n { res.append(path)  }
            var path = path
            var available: [Int] = []
            for i in 0..<n { available.append(i) }
            
            for (i, val) in path.enumerated() {
                if let index = available.firstIndex(of: val - path.count + i) {
                    available.remove(at: index)
                }
                
                if let index = available.firstIndex(of: val) {
                    available.remove(at: index)
                }
                
                if let index = available.firstIndex(of: val + path.count - i) {
                    available.remove(at: index)
                }
            }
            
            for i in 0..<n {
                if available.contains(i) == false { continue }
                path.append(i)
                backtarck(path)
                path.remove(at: path.count - 1)
            }
        }
        
        backtarck([])
        
        return res.map({ (path: [Int]) -> [String] in
            var res: [String] = []
            for i in path {
                var string = ""
                for j in 0..<n { string += (i == j ? "Q" : ".") }
                res.append(string)
            }
            return res
        })
    }
}
