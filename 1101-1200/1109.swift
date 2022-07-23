class Solution {
    
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var openings: [Int: Int] = [:]
        var closings: [Int: Int] = [:]
        var count = 0
        var result: [Int] = []

        for booking in bookings {
            let opening = booking[0]
            let closing = booking[1]
            let count = booking[2]
            openings[opening, default: 0] += count
            closings[closing, default: 0] += count
        }

        for i in 1 ... n {
            let opening = openings[i, default: 0]
            let closing = closings[i - 1, default: 0]
            count = count + opening - closing
            result.append(count)
        }

        return result
    }
}
