class Solution {
      func maximumNumber(_ num: String, _ change: [Int]) -> String {
        var temp = num
        let numStartIndex = num.startIndex
        var lastChangeIndex = Int.max
        var max = num
        let changes = change.map { "\($0)" }

        for (index, char) in num.enumerated() {
            let changeIndex = Int(char.asciiValue!) - 48
            if changeIndex <= change[changeIndex] {
                if index - lastChangeIndex > 1 {
                    if temp > max { max = temp }
                    temp = num
                }
                let strIndex = num.utf8.index(numStartIndex, offsetBy: index)
                temp.replaceSubrange(strIndex...strIndex, with: changes[changeIndex])
                lastChangeIndex = index
            }
        }
        let tempNumber = temp
        if tempNumber > max { max = temp }
        return max.description
    }

}
