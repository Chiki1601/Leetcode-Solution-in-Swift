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
   
    func pseudoPalindromicPaths(_ root: TreeNode?) -> Int { dfs(root, 0) }
    
    
    private func dfs(_ node: TreeNode?, _ path: Int) -> Int {
        guard let node = node else { return 0 }
        
        var path = path ^ 1 << (node.val - 1)
        var ans = dfs(node.left, path) + dfs(node.right, path)
        
        if node.left == nil, node.right == nil, path & (path - 1) == 0 { ans += 1 }
        return ans
    }
}
