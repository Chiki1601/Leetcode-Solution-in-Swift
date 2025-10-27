class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var arr = [Int]()
        var sum = 0
        var bank = bank
        for ele in bank {
            arr.append(Array(ele).filter {$0 == "1"}.count)
        }
        arr = arr.filter{$0 > 0}
        guard arr.count > 0 else {
            return 0
        }
        for i in 0..<arr.count-1 {
            sum += arr[i] * arr[i+1]
        }
        return sum
    }
}
