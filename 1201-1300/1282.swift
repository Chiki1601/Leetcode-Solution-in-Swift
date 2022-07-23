class Solution {
    
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var groups = [Int: [Int]]()

        for (index, number) in groupSizes.enumerated() {
            var group = groups[number] ?? [Int]()
            group.append(index)
            if group.count == number {
                answer.append(group)
                groups[number]?.removeAll()
            } else {
                groups[number] = group
            }
        }
        
        return answer
    }
}
