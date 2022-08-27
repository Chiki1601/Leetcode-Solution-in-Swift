class Solution {
        func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []


        func backtrack(_ path: [Int], _ max: Int, _ target: Int) {
            if target == 0 {
                res.append([])
                return
            }
            
            if path.count == target {
                res.append(path.map({ nums[$0] }))
                return
            }
            
            var path = path
            
            for index in max+1..<nums.count {
                path.append(index)
                backtrack(path, index, target)
                path.remove(at: path.count - 1)
            }
        }
        
        for i in 0...nums.count {
            backtrack([], -1, i)
        }
        
        return res
    }
}
