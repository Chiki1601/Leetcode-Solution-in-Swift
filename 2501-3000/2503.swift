class Solution {
    func maxPoints(_ grid: [[Int]], _ queries: [Int]) -> [Int] {
        let rows = grid.count
        let cols = grid[0].count
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

        let sortedQueries = queries.enumerated().sorted { $0.element < $1.element }
        var result = [Int](repeating: 0, count: queries.count)

        var minHeap = MinHeap()
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)

        minHeap.push((grid[0][0], 0, 0))
        visited[0][0] = true
        var points = 0

        for (queryIdx, queryVal) in sortedQueries {
            while !minHeap.isEmpty, let (value, r, c) = minHeap.peek(), value < queryVal {
                minHeap.pop()
                points += 1

                for (dr, dc) in directions {
                    let nr = r + dr, nc = c + dc
                    if nr >= 0, nr < rows, nc >= 0, nc < cols, !visited[nr][nc] {
                        minHeap.push((grid[nr][nc], nr, nc))
                        visited[nr][nc] = true
                    }
                }
            }

            result[queryIdx] = points
        }
        return result
    }
}

// MinHeap (Priority Queue) Implementation
struct MinHeap {
    private var heap: [(Int, Int, Int)] = []

    private func parentIndex(_ i: Int) -> Int { return (i - 1) / 2 }
    private func leftChildIndex(_ i: Int) -> Int { return 2 * i + 1 }
    private func rightChildIndex(_ i: Int) -> Int { return 2 * i + 2 }

    mutating func push(_ value: (Int, Int, Int)) {
        heap.append(value)
        siftUp(heap.count - 1)
    }

    mutating func pop() -> (Int, Int, Int) {
        if heap.count == 1 {
            return heap.removeLast()
        }
        let minValue = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return minValue
    }

    func peek() -> (Int, Int, Int)? {
        return heap.first
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    private mutating func siftUp(_ index: Int) {
        var i = index
        while i > 0, heap[i].0 < heap[parentIndex(i)].0 {
            heap.swapAt(i, parentIndex(i))
            i = parentIndex(i)
        }
    }

    private mutating func siftDown(_ index: Int) {
        var i = index
        while true {
            let left = leftChildIndex(i)
            let right = rightChildIndex(i)
            var smallest = i

            if left < heap.count, heap[left].0 < heap[smallest].0 {
                smallest = left
            }
            if right < heap.count, heap[right].0 < heap[smallest].0 {
                smallest = right
            }
            if smallest == i { break }
            heap.swapAt(i, smallest)
            i = smallest
        }
    }
}
