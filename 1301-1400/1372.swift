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
  
    enum Direction { case left, right }


    var longestLength: Int = 0


    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        findLongest(root.left, .left, 1)
        findLongest(root.right, .right, 1)

        return longestLength
    }


    func findLongest(_ node: TreeNode?, _ direction: Direction, _ length: Int) {
        guard let node = node else { return }

        self.longestLength = self.longestLength < length ? length : self.longestLength

        switch direction {
            case .left: findLongest(node.left, .left, 1); findLongest(node.right, .right, length + 1)
            case .right: findLongest(node.left, .left, length + 1); findLongest(node.right, .right, 1)
        }
    }
}
