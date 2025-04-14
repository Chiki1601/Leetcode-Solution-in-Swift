class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        arr
            .combinations(ofCount: 3)
            .filter { abs($0[0] - $0[1]) <= a }
            .filter { abs($0[1] - $0[2]) <= b }
            .filter { abs($0[0] - $0[2]) <= c }
            .count
    }
}
