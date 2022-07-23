class Solution {
     func myAtoi(_ s: String) -> Int {
        var isLeading = true
        var isSign = false
        var isNegtive = false
        var isValid = true
        var nums: [Int] = []
        var isLeadingZero = true
        var res: Int = 0

        for c in s {
            switch c {
            case " ":
                if isLeading == false { isValid = false }
            case "-", "+":
                isLeading = false
                if isSign || nums.count > 0 { isValid = false } 
                else {
                    isSign = true
                    isNegtive = c == "-" ? true : false
                }
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                isLeading = false
                nums.append(Int(String(c))!)
            default: isValid = false
            }
            if isValid == false { break }
        }

        for num in nums {
            if num == 0 && isLeadingZero { continue } else { isLeadingZero = false }
            res = num + 10 * res
            
            if isNegtive && res > Int(pow(2.0, 31)) { res = Int(pow(2.0, 31)); break }
            if !isNegtive && res > Int(pow(2.0, 31)) - 1 { res = Int(pow(2.0, 31)) - 1; break }
        }

        return isNegtive ? -1 * res : res
    }
}
