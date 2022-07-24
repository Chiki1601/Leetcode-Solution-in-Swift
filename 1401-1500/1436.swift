class Solution {
   
    func destCity(_ paths: [[String]]) -> String {
        var i = 0
        var j = 0
        let length = paths.count

        while i < length {
            if paths[j][1] == paths[i][0] {
                i = 0
                j += 1
            } else {
                i += 1
            }

            if i == length - 1 && paths[j][1] != paths[i][0] { return paths[j][1] }
        }
        
        return paths[j][1]
    }
}
