class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        if nums.isEmpty || nums.count == 1 { return nums }
        
        let sorted = nums.sorted()
        var largestDivisibleSubsetSize = 0
        let numsCount = sorted.count
        var divisorsCount = Array(repeating: 1, count: numsCount)
        var previous = Array(repeating: -1, count: numsCount)
        var subset = [Int]()
        
        for i in 1..<numsCount {
            for j in 0..<i {
                if sorted[i] % sorted[j] == 0 && divisorsCount[i] < divisorsCount[j] + 1 {
                    divisorsCount[i] = divisorsCount[j] + 1
                    previous[i] = j
                }
            }
            
            if divisorsCount[largestDivisibleSubsetSize] < divisorsCount[i] {
                largestDivisibleSubsetSize = i
            }
        }
        

        var k = largestDivisibleSubsetSize
        while k >= 0 {
            subset.append(sorted[k])
            k = previous[k]
        }
        
        return subset.reversed()
    }
}
