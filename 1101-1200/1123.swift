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
     func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? { dfs(root).node }
    
    
    private func dfs(_ root: TreeNode?) -> (node: TreeNode?, dist: Int) {
        guard let root = root else { return (nil, 0) }
        
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        if left.dist > right.dist { return (left.node, left.dist + 1) }
        if left.dist < right.dist { return (right.node, right.dist + 1) }
        
        return (root, left.dist + 1)
    }
}
