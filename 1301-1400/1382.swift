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
      func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var valList: [Int] = []
        
        getTreeList(root, &valList)
        return buildTree(valList, 0, valList.count - 1)
    }


    func getTreeList(_ root: TreeNode?, _ valList: inout [Int]) {
        guard let root = root else { return }

        getTreeList(root.left, &valList)
        valList.append(root.val)
        getTreeList(root.right, &valList)
    }


    func buildTree(_ valList: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        let mid = (right - left) / 2 + left
        let tree = TreeNode(valList[mid])

        tree.left = buildTree(valList, left, mid - 1)
        tree.right = buildTree(valList, mid + 1, right)

        return tree
    }

}
