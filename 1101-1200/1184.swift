class Solution {
   
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        let minPoint = min(start, destination)
        let maxPoint = max(start, destination)
        let doubleDistance = distance + distance
        guard minPoint < maxPoint else { return 0 }

        let sum1 = doubleDistance[minPoint..<maxPoint].reduce(0, +)
        let sum2 = doubleDistance[maxPoint..<(minPoint + distance.count)].reduce(0, +)
        return min(sum1, sum2)
    }
}
