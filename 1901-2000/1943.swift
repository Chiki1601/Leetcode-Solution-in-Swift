class Solution {
     func splitPainting(_ segments: [[Int]]) -> [[Int]] {
        guard segments.count > 1 else { return segments }
        var arrow = [Int](repeating: 0, count: 100005)
        var isSplitPoint = [Bool](repeating: false, count: 100005)
        var ans = [[Int]]()
        var last = 0
        
        for segement in segments {
            arrow[segement[0]] += segement[2]
            arrow[segement[1]] -= segement[2]
            isSplitPoint[segement[0]] = true
            isSplitPoint[segement[1]] = true
        }

        for i in 1...100000 { arrow[i] += arrow[i - 1] }
        
        for i in 1...100000 where arrow[i] != arrow[last] || isSplitPoint[i] {
            if arrow[last] != 0 { ans.append([last, i, arrow[last]]) }
            last = i
        }
        return ans
    }

}
