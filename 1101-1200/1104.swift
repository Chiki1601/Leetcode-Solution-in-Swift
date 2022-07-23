class Solution {
        func pathInZigZagTree(_ label: Int) -> [Int] {
        var num = 0
        var powNum: Double = 0
        var level = 0
        var output = [Int]()
        var label = label

        while label > num {
            num += Int(pow(2, powNum))
            powNum += 1
            level += 1
        }

        output.append(label)
        powNum -= 1

        while level > 1 {
            if level % 2 == 0 {
                let powValue = Int(pow(2, powNum))
                let offset = (label - (num - powValue + 1) + 1) + (label - (num - powValue + 1)) / 2
                label -= offset
                output.insert(label, at: 0)
            } else {
                let powValue = Int(pow(2, powNum))
                let offset =  (label - (num - powValue + 1) + 1) + (label - (num - powValue + 1)) / 2
                label -= offset
                output.insert(label, at: 0)
            }
            num -= Int(pow(2, powNum))
            powNum -= 1
            level -= 1
        }
        
        return output
    }
}
