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
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var nums: [Int] = []
        
        func copyNodes(_ node: TreeNode?, _ left: TreeNode?, _ right: TreeNode?) -> TreeNode? {
            if node == nil { return nil } 
            else {
                let newNode = TreeNode(node!.val)
                newNode.left = copyNodes(left, left?.left, left?.right)
                newNode.right = copyNodes(right, right?.left, right?.right)
                return newNode
            }
        }

        func generateNodes(_ node: TreeNode?, _ left: [TreeNode?], _ right: [TreeNode?]) -> [TreeNode?] {
            let leftCount = left.count > 0 ? left.count : 1
            let rightCount = right.count > 0 ? right.count : 1
            var res: [TreeNode?] = []
            
            for i in 0..<leftCount {
                let leftNode = left.count > 0 ? left[i] : nil
                for j in 0..<rightCount {
                    let rightNode = right.count > 0 ? right[j] : nil
                    res.append(copyNodes(node, leftNode, rightNode))
                }
            }
            return res
        }

        func nodes(_ nums: [Int]) -> [TreeNode?] {
            if nums.count == 0 { return [] }
            var res: [TreeNode?] = []

            for (i, num) in nums.enumerated() {
                let node = TreeNode(num)
                let leftNodes = i > 0 ? nodes(Array(nums[0..<i])) : nodes([])
                let rightNodes = i < nums.count - 1 ? nodes(Array(nums[i + 1...nums.count - 1])) : nodes([])
                res += generateNodes(node, leftNodes, rightNodes)
            }
            return res
        }
        
        for num in 1...n { nums.append(num) }
        return nodes(nums)
    }

}
