class Solution {
   
    func rankTeams(_ votes: [String]) -> String {
        guard votes.count > 1 else { return votes.isEmpty ? "" : votes.first! }
        var ranks: [Character: [Int]] = [:]

        for i in 0..<votes.count {
            let vote = Array(votes[i])
            let teamCount = vote.count
            for j in 0..<teamCount {
                let team = vote[j]
                ranks[team, default: [Int](repeating: 0, count: teamCount)][j] += 1
            }
        }

        var teams = Array(votes.first!)
        teams.sort {
            for rank in 0..<ranks.count {
                if ranks[$0]![rank] != ranks[$1]![rank] {
                    return ranks[$0]![rank] > ranks[$1]![rank]
                }
            }
            return $0 < $1
        }
        
        return String(teams)
    }
}
