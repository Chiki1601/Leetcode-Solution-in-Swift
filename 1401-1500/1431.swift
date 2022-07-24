class Solution {
   
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        if candies.count == 0 { return [] }
        let max = candies.max()!
        var res = [Bool](repeating: false, count: candies.count)
        
        for (index, item) in candies.enumerated() where (item + extraCandies) >= max { res[index] = true }
        return res
    }
}
