class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var positives=[Int]()
        var negatives=[Int]()
        var merged=[Int]()
        for num in nums{
            if num > 0{
                positives.append(num)
            }else{
                negatives.append(num)
                
            }
        }
        
        for i in 0..<negatives.count{
            merged.append(positives[i])
            merged.append(negatives[i])
        }
        
        return merged
    }
}
