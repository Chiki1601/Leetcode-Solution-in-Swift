class Solution {
     func simplifyPath(_ path: String) -> String {
        let paths = path.split(separator: "/")
        
        var stack = [String]()
        for path in paths {
            guard path != ".", !path.isEmpty else { continue }
            
            if path == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(path))
            }
        }
        
        return "/\(stack.joined(separator: "/"))"
    }

}
