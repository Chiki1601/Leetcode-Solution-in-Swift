class Solution {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        var res: [[String]] = []

        
        func sort(_ str: String) -> String {
            var chars = Array(str)
            let sorted = chars.sorted()
            var string = ""
            for c in sorted { string += String(c) }
            return string
        }

        for str in strs {
            let sorted_str = sort(str)
            if let _ = map[sorted_str] {
                map[sorted_str]?.append(str)
            } else {
                map[sorted_str] = [str]
            }
        }
        for (_, value) in map { res.append(value) }        
        return res
    }
}
