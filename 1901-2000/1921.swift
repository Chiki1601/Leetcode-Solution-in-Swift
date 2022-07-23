import CoreFoundation


class Solution {

   
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let minHeap = CFBinaryHeap.getMinHeapOfTime()
        var pointer: UnsafeMutablePointer<Double> = .allocate(capacity: 1)
        var time = 0.0
        var ans = 0

        for idx in 0..<dist.count {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: Double(dist[idx]) / Double(speed[idx]))
            CFBinaryHeapAddValue(minHeap, pointer)
        }

        while CFBinaryHeapGetCount(minHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Double.self)
            guard top > time else { break }
            ans += 1
            time += 1.0
            CFBinaryHeapRemoveMinimumValue(minHeap)
        }
        pointer.deallocate()
        CFBinaryHeapRemoveAllValues(minHeap)
        return ans
    }
}


extension CFBinaryHeap {
    static func getMinHeapOfTime() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a, b, _ in
            let t1 = a!.load(as: Double.self)
            let t2 = b!.load(as: Double.self)

            return t1 == t2 ? .compareEqualTo : (t1 < t2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
