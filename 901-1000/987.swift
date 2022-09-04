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
      func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int: [(Int, Int)]]()
        var ans = [[Int]]()

        dfs(root, x: 0, y: 0, dict: &dict)

        for key in dict.keys.sorted() {
            guard let val = dict[key] else { continue }
            let v = val.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 >= $1.0 }
            ans.append(v.map { $0.1 })
        }

        return ans
    }

    
    private func dfs(_ root: TreeNode?, x: Int, y: Int, dict: inout [Int: [(Int, Int)]]) {
        guard let root = root else { return }

        dict[x, default: [(Int, Int)]()].append((y, root.val))
        dfs(root.left, x: x - 1, y: y - 1, dict: &dict)
        dfs(root.right, x: x + 1, y: y - 1, dict: &dict)
    }
}
