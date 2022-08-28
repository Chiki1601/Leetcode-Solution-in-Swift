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
   
    private var prev: Int?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorder(root)
    }
    
    private func inorder(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard inorder(root.left) else { return false }
        
        if let prev = prev, root.val <= prev { return false }
        
        prev = root.val
        return inorder(root.right)
    }

}
