
class Solution {
    
    func reformat(_ s: String) -> String {
        var finalStr = ""
        var digitStr = ""
        var letterStr = ""
        var i = 0

        for char in s {
            if char.isLowercase { letterStr.append(char) } 
            else { digitStr.append(char) }
        }

        if abs(digitStr.count - letterStr.count) > 1 { return "" }

        if digitStr.count < letterStr.count {
            let swapStr = digitStr
            digitStr = letterStr
            letterStr = swapStr
        }

        while i < digitStr.count {
            finalStr.append(digitStr[String.Index(utf16Offset: i, in: s)])
            if i < letterStr.count { finalStr.append(letterStr[String.Index(utf16Offset: i, in: s)]) }
            i += 1
        }

        return finalStr
    }
}
