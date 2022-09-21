class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var arr = A
        var evemSum = A.reduce(0, { (res: Int, a: Int) -> Int in res + (a & 1 == 0 ? a : 0) })
        
        var resArr = [Int](repeating: 0, count: queries.count)
        for (i, q) in queries.enumerated() {
            if arr[q[1]] & 1 == 0 { evemSum -= arr[q[1]] }
            arr[q[1]] += q[0]
            if arr[q[1]] & 1 == 0 { evemSum += arr[q[1]] }
            resArr[i] = evemSum
        }
        
        return resArr
    }
}
