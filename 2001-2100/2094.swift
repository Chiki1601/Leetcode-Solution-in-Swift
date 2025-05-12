class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var set_: Set<Int> = []
        
        for digit in digits {
            dict[digit, default: 0] += 1
        }
        
        for dig1 in dict.keys where dig1 != 0 {
            dict[dig1]! -= 1
            for dig2 in dict.keys where dict[dig2]! > 0 {
                dict[dig2]! -= 1
                for dig3 in dict.keys where dict[dig3]! > 0 && dig3 % 2 == 0 {
                    set_.insert(dig1 * 100 + dig2 * 10 + dig3)
                }
                dict[dig2]! += 1
            }
            dict[dig1]! += 1
        }
        
        return Array(set_).sorted()
    }
}
