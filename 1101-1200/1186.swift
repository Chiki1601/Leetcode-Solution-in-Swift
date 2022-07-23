class Solution {
  
    func maximumSum(_ arr: [Int]) -> Int {
        guard arr.count > 1 else { return arr[0] }
        var ans = arr[0]
        var oneDel = 0
        var noDel = arr[0]
        
        for i in 1..<arr.count {
            oneDel = max(oneDel + arr[i], noDel)
            noDel = max(noDel + arr[i], arr[i])
            ans = max(oneDel, noDel,ans)
        }
        
        return ans
    }
}
