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
    
    
    var result = 0


    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        dfs(root, distance)
        return result
    }
    

    func dfs(_ node: TreeNode?, _ distance: Int) -> [Int: Int] { // (distance, count of leaf nodes)
        guard let node = node else { return [0: 0] }
        if node.left == nil, node.right == nil { return [0: 1] } // leaf ndoe
        let l = dfs(node.left, distance)
        let r = dfs(node.right, distance)
        var dict = [Int: Int]()

        for (dLeft, countLeft) in l {
            for (dRight, countRight) in r where dLeft + dRight + 2 <= distance {
                result += (countLeft * countRight)
            }
        }

        for d in 0..<distance {
            let lc = l[d] ?? 0
            let rc = r[d] ?? 0
            dict[d + 1] = lc + rc
        }

        return dict
    }
}
