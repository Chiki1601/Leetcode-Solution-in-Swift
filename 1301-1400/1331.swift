class Solution {
  
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let sorted = Array(Set(arr)).sorted()
        var store = [Int: Int]()
        var counter = 0
        var result = [Int]()

        for (i, num) in sorted.enumerated() {
            if let val = store[num] {} else { store[num] = i + 1 }
        }

        for num in arr {
            if let val = store[num] { result.append(val) }
        }

        return result
    }
}
