class Solution {
    func hasIncreasingSubarrays(_ nums: [Int], _ k: Int) -> Bool {
        (nums + [Int.min])
            .chunked(by: <)
            .map(\.count)
            .adjacentPairs()
            .contains { max($0 / 2, $1 / 2, min($0, $1)) >= k }
    }
}
