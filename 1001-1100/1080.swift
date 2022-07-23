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
    func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {
        guard let rootVal = root?.val else { return nil }
        guard root?.left !== root?.right else { return rootVal < limit ? nil : root }

        root?.left = sufficientSubset(root?.left, limit -  rootVal)
        root?.right = sufficientSubset(root?.right, limit - rootVal)
        return  root?.left === root?.right ? nil : root
    }
}
