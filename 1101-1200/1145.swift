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
    var x = 0
    var left = 0
    var right = 0
    

    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        self.x = x
        check(root)
        return max(max(left, right), n - left - right - 1) > n / 2
    }
    

    func check(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        var l = check(root!.left)
        var r = check(root!.right)
        
        if root!.val == x {
            left = l
            right = r
        }
        return l + r + 1
    }
}
