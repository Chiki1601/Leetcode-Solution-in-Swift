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
     func flatten(_ root: TreeNode?) {
        var tail: TreeNode?
        
        func preOrder(_ root: TreeNode?) {
            guard let root = root else { return }
            
            let left = root.left
            let right = root.right
            
            if tail == nil {
                tail = root
            } else {
                tail?.right = root
            }
            
            tail?.left = nil
            tail = root
            preOrder(left)
            preOrder(right)
        }
        
        preOrder(root)
    }
    
}
