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
    
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else { return [] }
        let toDelete = Set(to_delete)
        var result = [TreeNode?]()

        delNodes(root, toDelete, &result)
        
        if !toDelete.contains(root.val) { result.append(root) }
        return result
    }
        
        
    func delNodes(_ root: TreeNode?, _ toDelete: Set<Int>, _ result: inout [TreeNode?]) -> TreeNode? {
        guard let root = root else { return nil }
        
        root.left = delNodes(root.left, toDelete, &result)
        root.right = delNodes(root.right, toDelete, &result)
        
        if toDelete.contains(root.val) {
            if let left = root.left { result.append(left) }
            if let right = root.right { result.append(right) }
            return nil
        }
        
        return root
    }
    
}
