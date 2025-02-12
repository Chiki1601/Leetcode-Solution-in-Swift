import Algorithms

class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        nums
            .grouped { 
                sequence(first: $0) { 
                    $0 == 0 ? nil : $0 / 10 
                }
                .reduce(into: 0) { $0 += $1 % 10 }
            }
            .map(\.value)
            .filter { $0.count >= 2 }
            .map { $0.max(count: 2) }
            .map { $0[0] + $0[1] }
            .max() ?? -1
    }
}
