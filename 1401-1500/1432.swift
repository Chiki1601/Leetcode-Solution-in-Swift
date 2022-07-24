class Solution {
   func maxDiff(_ num: Int) -> Int {
        let numStr = "\(num)"
        let a: Int
        let b: Int
        
        if let victim = numStr.first(where: { $0 != "9" }) {
            a = Int(numStr.replacingOccurrences(of: "\(victim)", with: "9"))!
        } else {
            a = num
        }

        if numStr.first! != "1" {
            b = Int(numStr.replacingOccurrences(of: "\(numStr.first!)", with: "1"))!
        } else if let victim = numStr.dropFirst().first(where: { $0 != "0" && $0 != "1" }) {
            b = Int(numStr.replacingOccurrences(of: "\(victim)", with: "0"))!
        } else {
            b = num
        }

        return a - b
    }

}
