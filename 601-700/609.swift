class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dict = [String : Int]()
        var res = [[String]]()
        var index = 0
        
        for path in paths {
            let arr = path.components(separatedBy: " ")
            let head = arr.first ?? ""
            for str in arr {
                let content = str.components(separatedBy: "(")
                if let first = content.first, let last = content.last, content.count == 2{
                    dict[last] = dict[last] ?? index
                    if dict[last]! >= res.count {
                        res.append([head + "/" + first])
                        index += 1
                    }else {
                        res[dict[last]!].append(head + "/" + first)
                    }
                }
            }
        }
        
        return res.filter{ $0.count > 1 }
    }
}
