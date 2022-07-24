class Solution {
   
    func mySort(_ piles: [Int]) -> [Int] {
        var temp = [Int](repeating: 0, count: 10001)
        var output = piles
        var pos = 0

        piles.forEach { temp[$0] += 1 }
        for (index, value) in temp.enumerated() where value > 0 {
            for _ in 0..<value {
                output[pos] = index
                pos += 1
            }
        }
        return output
    }


    func maxCoins(_ piles: [Int]) -> Int {
        var sortedPile = mySort(piles), sum = 0, pos = 0

        while piles.count - pos * 2 - 2 > pos {
            sum += sortedPile[piles.count - pos * 2 - 2]
            pos += 1
        }

        return sum
    }

}
