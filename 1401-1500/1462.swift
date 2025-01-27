class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        let n = numCourses
        var isPrerequisite = Array(repeating: Array(repeating: false, count: n), count: n)

        for pre in prerequisites {
            isPrerequisite[pre[0]][pre[1]] = true
        }

        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if isPrerequisite[i][k] && isPrerequisite[k][j] {
                        isPrerequisite[i][j] = true
                    }
                }
            }
        }

        return queries.map { query in isPrerequisite[query[0]][query[1]] }
    }
}
