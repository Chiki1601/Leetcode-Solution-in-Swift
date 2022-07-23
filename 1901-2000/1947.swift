class Solution {
     func maxCompatibilitySum(_ students: [[Int]], _ mentors: [[Int]]) -> Int {
        let rowCount = students.count
        let columnCount = students[0].count
        var permutations = [[Int]]()
        var maxCount = 0
        var cachedCount = [String: Int]()
        
        do {
            let n = rowCount
            var output = [Int](0..<n)
            func permute(first: Int) {
                if first == n { permutations.append(output); return }
                for i in first..<n {
                    output.swapAt(i, first)
                    permute(first: first + 1)
                    output.swapAt(i, first)
                }
            }
            permute(first: 0)
        }

        func count(student: [Int], mentor: [Int]) -> Int {
            (0..<columnCount).reduce(into: 0) { result, i in
                result += (student[i] == mentor[i] ? 1 : 0)
            }
        }

        for permutation in permutations {
            var perCount = 0
            for i in 0..<rowCount {
                let student = students[i]
                let mentorIndex = permutation[i]
                let mentor = mentors[mentorIndex]
                let key = i.description + mentorIndex.description
                if let cached = cachedCount[key] { perCount += cached; continue }
                let c = count(student: student, mentor: mentor)
                cachedCount[key] = c
                perCount += c
            }
            maxCount = max(perCount, maxCount)
        }

        return maxCount
    }
}
