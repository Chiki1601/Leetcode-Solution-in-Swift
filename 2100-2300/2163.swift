struct Heap<T> {
    var data = [T]()
    let areSorted: (T, T) -> Bool

    init(_ sort: @escaping (T, T) -> Bool) {
        self.areSorted = sort
    }

    var count: Int { data.count }
    
    mutating func push(_ val: T) {
        data.append(val)
        siftUp(data.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !data.isEmpty else { return nil }
        
        data.swapAt(0, data.count - 1)

        let val = data.removeLast()
        siftDown(0)
        
        return val
    }
    
    mutating func siftUp(_ i: Int) {
        var child = i
        var parent = (child - 1) / 2
        
        while child > 0 && !areSorted(data[parent], data[child]) {
            data.swapAt(parent, child)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func siftDown(_ i: Int) {
        var parent = i
        
        while true {
            let left = 2*parent + 1, right = left + 1
            var candidate = parent
        
            if left < data.count && !areSorted(data[candidate], data[left]) {
                candidate = left
            }
        
            if right < data.count && !areSorted(data[candidate], data[right]) {
                candidate = right
            }
        
            guard candidate != parent else { break }
            
            data.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {
        let N = nums.count
        let n = N / 3
        var leftSum = [Int](repeating: 0, count: N+1)
        var maxHeap = Heap<Int>({ $0 > $1 })
        var sumL = 0
        
        for i in 0..<n {
            sumL += nums[i]
            maxHeap.push(nums[i])
        }
        
        leftSum[n] = sumL
        
        for i in n..<(2*n) {
            sumL += nums[i]
            maxHeap.push(nums[i])
            
            if maxHeap.count > n, let x = maxHeap.pop() {
                sumL -= x
            }
            
            leftSum[i+1] = sumL
        }

        var rightSum = [Int](repeating: 0, count: N+1)
        var minHeap = Heap<Int>({ $0 < $1 })
        var sumR = 0

        for i in (2*n..<N).reversed() {
            sumR += nums[i]
            minHeap.push(nums[i])
        }
        
        rightSum[2*n] = sumR

        for i in (n..<2*n).reversed() {
            sumR += nums[i]
            minHeap.push(nums[i])
            
            if minHeap.count > n, let x = minHeap.pop() {
                sumR -= x
            }
            
            rightSum[i] = sumR
        }

        var ans = Int.max
        
        for k in n...2*n {
            ans = min(ans, leftSum[k] - rightSum[k])
        }

        return ans
    }
}
