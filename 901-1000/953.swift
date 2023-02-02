class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character:Int]()
        var arr = Array(order)
        for i in 0..<arr.count{
            dict[arr[i]] = i
        }
        
        for i in 0..<words.count-1{
            var first = words[i]
            var second = words[i+1]
            
            var len = min(first.count, second.count)
            var flag = 0
            for j in 0...len{
                flag = j
                if(j == len){
                    break;
                }
                
                var a = Array(first)[j]
                var b = Array(second)[j]
                if a != b{
                    if(dict[a]! > dict[b]!){
                        return false
                    }else{
                        break
                    }
                }
            }
            
         
            if flag == len && first.count > second.count{
                return false
            }
        }
        return true
    
    }
	
}
