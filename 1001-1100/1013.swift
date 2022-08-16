class Solution{  
  func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        var sum = 0
        var countParts = 0
        var tempSum = 0

        for num in A { sum += num }

        if sum % 3 == 0 {
            let devider = sum / 3

            for num in A {
                tempSum += num
                if tempSum == devider {
                    countParts += 1
                    tempSum = 0
                }
            }
            if countParts < 3 { return false }
        } else { return false }
        
        return true
    }
}
