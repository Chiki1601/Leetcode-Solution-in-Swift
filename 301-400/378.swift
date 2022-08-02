class Solution {
   
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var synthetic = [Int]()
        
        for i in matrix { synthetic += i }
        
        synthetic.sort()
        
        for i in 0..<synthetic.count where i == k - 1 { return synthetic[i] }
        
        return 0
    }
    
}
