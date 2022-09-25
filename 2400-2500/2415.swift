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

    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {

        guard let r = root else {return root}
        var queue = [r]
        var depth = 0
        while !queue.isEmpty {
            var newLevel = [TreeNode]()
            depth += 1
            for node in queue {
                if let l = node.left {
                    newLevel.append(l)
                }
                if let r = node.right {
                    newLevel.append(r)
                }
            }
            if depth & 1 == 1 {
                var left = 0
                var right = newLevel.count - 1
                while left < right {
                    swap(&newLevel[left].val, &newLevel[right].val)
                    left += 1
                    right -= 1
                }
            }
            queue = newLevel
        }
        return r
    }
}
