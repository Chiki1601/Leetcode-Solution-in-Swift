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
     func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        var stack = [TreeNode?]()
        var curr = root

        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            if let val = curr?.val {
                ans.append(val)
            }
            curr = curr?.right
        }

        return ans
    }

    /*
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        
        func inorder(_ node: TreeNode?) {
            if node == nil { return } 
            
            inorder(node!.left)
            res.append(node!.val)
            inorder(node!.right)
        }
        
        inorder(root)
        return res
    }
    */
}
