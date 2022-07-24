class Solution {
       func findMinFibonacciNumbers(_ k: Int) -> Int {
        var fibinacciNum : [Int] = []
        var result = 1
        var sum = 0
        var sumArray: [Int] = []

        for i in 0..<k + 1 {
            if  i < 2 {
                result += result
                fibinacciNum.append(1)
            }
            else {
                result = fibinacciNum[i - 1] + fibinacciNum[i - 2]
                if result > k { break }
                fibinacciNum.append(result)
            }
        }
        
        for j in fibinacciNum.reversed() {
            sum = j + sum
            if sum < k { sumArray.append(j) }
            else if sum > k { sum = sum - j }
            else { sumArray.append(j) }
        }

        return sumArray.count
    }
}
