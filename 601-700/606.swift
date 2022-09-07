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
       func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else { return "" }
        
        if t.left == nil && t.right == nil {
            return String(t.val)
        } else if t.left != nil && t.right == nil {
            return String(t.val) + "(" + self.tree2str(_: t.left) + ")"
        } else if t.left == nil && t.right != nil {
            return String(t.val) + "()" + "(" + self.tree2str(_: t.right) + ")"
        } else {
            return String(t.val) + "(" + self.tree2str(_: t.left) + ")" + "(" + self.tree2str(_: t.right) + ")"
        }    
    
    }
}
