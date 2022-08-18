class Solution {
     func minSetSize(_ arr: [Int]) -> Int {
        var map = [Int: Int]()
        var count = 0

        for num in arr {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }
        
        let sorted = map.sorted { (kv1, kv2) -> Bool in kv1.value > kv2.value }
        
        for i in 0..<sorted.count {
            let kv = sorted[i]
            count += kv.value
            if count >= arr.count / 2 { return i + 1 }
        }
        
        return 0
    }
            
    
}
