class Solution {
       func totalFruit(_ tree: [Int]) -> Int {
        var maxCollect = 0
        var i = 0
        var currentCollected = 0
        
        var b1: Int?
        var b2: Int?
        while i < tree.count{
            let fruit = tree[i]
            if b1 == nil {
                b1 = fruit
            } 
            
            if b2 == nil && b1! != fruit{
                b2 = fruit
            }
            
            if b1! != fruit && b2! != fruit {
                if maxCollect < currentCollected{
                    maxCollect = currentCollected
                }
                currentCollected = 0
                b1 = nil
                b2 = nil

                repeat{
                    i -= 1
                }while tree[i] == tree[i - 1]
                
                continue
            }
            currentCollected += 1
            i += 1
        }
        
        if maxCollect < currentCollected{
            return currentCollected
        }
        
        return maxCollect
    }
}
