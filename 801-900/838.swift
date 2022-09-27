class Solution {
      func pushDominoes(_ dominoes: String) -> String {
        var p = 0
        var flag = "L"
        let dominoesArr = Array(dominoes)
        var ans = ""
        
        for (i, d) in (dominoesArr+["R"]).enumerated() {
            switch d {
            case "L":
                if flag == "L" {
                    ans.append(String(repeating: "L", count: i - p + 1))
                } else {
                    if (i+p) % 2 == 0 {
                        let m = (i + p - 1) / 2
                        ans.append(String.init(repeating: "R", count: m - p + 1))
                        ans.append(String.init(repeating: "L", count: i - m))
                    } else {
                        let m = (i + p - 1) / 2
                        ans.append(String.init(repeating: "R", count: m - p))
                        ans.append(".")
                        ans.append(String.init(repeating: "L", count: i - m))
                    }
                }
                flag = "L"
                p = i+1
            case "R":
                ans.append(String(repeating: flag == "R" ? "R" : ".", count: i - p))
                ans.append("R")
                flag = "R"
                p = i+1
            default: break
            }
        }
        
        ans.removeLast()
        return ans
    }
}
