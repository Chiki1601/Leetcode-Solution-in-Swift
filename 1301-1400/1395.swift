class Solution {
   
    func numTeams(_ rating: [Int]) -> Int {
        var teamCount = 0

        for i in 1..<rating.count - 1{
            let origin = rating[i]
            var leftSmaller = 0
            var leftLarger = 0
            var rightSmaller = 0
            var rightLarger = 0

            for j in 0..<i {
                if rating[j] < origin {
                    leftSmaller += 1
                } else {
                    leftLarger += 1
                }
            }

            for j in i + 1..<rating.count {
                if rating[j] < origin {
                    rightSmaller += 1
                } else {
                    rightLarger += 1
                }
            }

            teamCount += (leftSmaller * rightLarger) + (leftLarger * rightSmaller)
        }

        return teamCount
    }
        
    
}
