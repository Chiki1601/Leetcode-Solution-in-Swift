class Solution {
  
    let chars = (0...9).map { Character.init(Unicode.Scalar.init( $0 + 48 ))}
    

    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let nums = s.map { Int($0.asciiValue!) - 48  }
        var visited = Set<String>()
        var queue = [[Int]]()
        let n = nums.count
        var ans = s
        var nextLevel = [[Int]]()


        func update(_ newNums: [Int]) {
            let str = getStr(newNums)
            if !visited.contains(str) {
                nextLevel.append(newNums)
                visited.insert(str)
                if ans > str { ans = str }
            }
        }

        visited.insert(s)
        queue.append(nums)

        while !queue.isEmpty {
            nextLevel = []
            for curNums in queue {
                var newNums1 = curNums // add 
                for i in stride(from: 1, through: n, by: 2) { newNums1[i] = (curNums[i] + a) % 10 }
                update(newNums1)
                
                let newNums2 = [Int](curNums[(n - b)...] + curNums[..<(n - b)]) // rotate
                update(newNums2)
            }
            queue = nextLevel
        }
        return ans
    }
    

    private func getStr(_ nums: [Int]) -> String {
        var ans = ""
        nums.forEach { ans.append(chars[$0]) }
        return ans
    }
}
