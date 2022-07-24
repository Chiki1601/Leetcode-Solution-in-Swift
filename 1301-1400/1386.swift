class Solution {
       func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        var dict = [Int: [Bool]]()
        var number = 0

        reservedSeats.forEach { dict[$0[0], default: .init(repeating: true, count: 10)][$0[1] - 1] = false }

        for row in dict.values {
            var count = 0
            if row[1], row[2], row[3], row[4] { count += 1 }
            if row[5], row[6], row[7], row[8] { count += 1 }
            if count == 0, row[3], row[4], row[5], row[6] { count += 1 }
            number += count
        }

        number += (n - dict.count) * 2
        return number
    }

        
    
}
