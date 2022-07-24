class Solution {
    
    func stoneGameVI(_ aliceValues: [Int], _ bobValues: [Int]) -> Int {
        var realValues:[(value:Int, index:Int)] = []
        var aliceTotalValue = 0
        var bobTotalValue = 0


        func sortNum(num1: (Int, Int), num2: (Int, Int)) -> Bool { num1.0 > num2.0 }

        for i in 0..<aliceValues.count { realValues.append((aliceValues[i] + bobValues[i], i)) }
        realValues.sort(by: sortNum)
        
        for i in 0..<realValues.count {
            if i % 2 == 0 {
                aliceTotalValue += aliceValues[realValues[i].index]
            } else {
                bobTotalValue += bobValues[realValues[i].index]
            }
        }

        if aliceTotalValue > bobTotalValue {
            return 1
        } else if aliceTotalValue == bobTotalValue {
            return 0
        } else {
            return -1
        }
    }
}
