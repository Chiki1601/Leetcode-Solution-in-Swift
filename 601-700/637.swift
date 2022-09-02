/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
       func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var ans = [Double]()
        var queue = [TreeNode]()

        queue.append(root)

        while !queue.isEmpty {
            var tmp = 0
            var count = queue.count
            for i in 0..<count {
                let first = queue.removeFirst()
                tmp += first.val
                if let left = first.left { queue.append(left) }
                if let right = first.right { queue.append(right) }
            }
            
            ans.append(Double(tmp) / Double(count))
        }
        
        return ans
    }

}
