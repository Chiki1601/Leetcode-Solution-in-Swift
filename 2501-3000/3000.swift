class Solution {
    func areaOfMaxDiagonal(_ dimensions: [[Int]]) -> Int {
        dimensions
            .map { (rectangle: [Int]) -> (diagonal: Int, area: Int) in
                (
                    rectangle[0] * rectangle[0] + rectangle[1] * rectangle[1],
                    rectangle[0] * rectangle[1]
                )
            }
            .max(by: <)
            .map(\.area) ?? 0
    }
}
