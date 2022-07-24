class Solution {
    func trimMean(_ arr: [Int]) -> Double {
        var sortedArr = arr.sorted()
        let n = arr.count
        let toDelete = n / 20

        sortedArr.removeFirst(toDelete)
        sortedArr.removeLast(toDelete)
        return sortedArr.reduce(0.0, { $0 +  Double($1) }) / Double(n - toDelete * 2)
    }
}
