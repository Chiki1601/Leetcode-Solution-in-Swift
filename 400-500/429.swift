/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
      func levelOrder(_ root: Node?) -> [[Int]] {
        var result = [[Int]]()
        guard let rootNode = root else { return result }
        
        var stack = [Node]()
        stack.append(rootNode)
        
        while !stack.isEmpty {
            var rowArray = [Int]()

            // count of stack is frozen at the time when iteration of for-loop starts
            for _ in 0..<stack.count {
                let dequedNode = stack.removeFirst()
                rowArray.append(dequedNode.val)
                
                for child in dequedNode.children {
                    stack.append(child)
                }
            }
            result.append(rowArray)
        }
        
        return result
    }
}
