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
     func canMerge(_ trees: [TreeNode?]) -> TreeNode? {
        var leavesValue = Set<Int>()
        var include = 0
        var finalRoot: TreeNode? = nil
        var map = [Int: TreeNode]()
        var nums = [Int]()
        var last = -1


        func dfs1(_ root: TreeNode?) {
            guard let r = root else { return }
            if let left = r.left {
                if let nextRoot = map[left.val] {
                    r.left = nextRoot
                    map.removeValue(forKey: left.val)
                }
            }
            if let right = r.right {
                if let nextRoot = map[right.val] {
                    r.right = nextRoot
                    map.removeValue(forKey: right.val)
                }
            }
            dfs1(r.left)
            dfs1(r.right)
        }

        func dfs(_ root: TreeNode?, _ nums: inout [Int])  {
            guard let r = root else { return }
            dfs(r.left, &nums)
            nums.append(r.val)
            dfs(r.right, &nums)
        }


        for root in trees {
            if let left = root?.left {
                guard !leavesValue.contains(left.val) else { return nil }
                leavesValue.insert(left.val)
            }
            if let right = root?.right {
                guard !leavesValue.contains(right.val) else { return nil }
                leavesValue.insert(right.val)
            }
        }
        for root in trees {
            if let r = root {
                if leavesValue.contains(r.val) {
                    include += 1
                } else {
                    finalRoot = root
                }
            }
        }
        guard include + 1 == trees.count else { return nil }
        for root in trees {
            guard let r = root else { continue }
            map[r.val] = root
        }
        dfs1(finalRoot)
        guard map.count == 1 else { return nil }
        dfs(finalRoot, &nums)
        for num in nums {
            guard num > last else { return nil }
            last = num
        }
        return finalRoot
    }
    
}
