class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var arr = nums.map { Array($0) }
        var results = [""]
        for i in 0..<nums.count {
            let previous = results
            results.removeAll()
            if arr.contains(where: { $0[i] == "1" }) {
                results += previous.map { $0 + "0" }
            }
            if arr.contains(where: { $0[i] == "0" }) {
                results += previous.map { $0 + "1" }
            }
        }
        return results.first(where: { !nums.contains($0) } )!
    }
}
