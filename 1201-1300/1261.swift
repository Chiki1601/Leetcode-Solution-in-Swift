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

class FindElements {
  
    var root: TreeNode?
    
    
    init(_ root: TreeNode?) {
        root?.val = 0
        recover(root)
        self.root = root
    }
    
    
    func find(_ target: Int) -> Bool {
        var target = target
        var path = [Int]()
        
        while target > 0 {
            if target % 2 == 0 {
                target = (target - 2) / 2
                path.insert(1, at: 0)
            } else {
                target = (target - 1) / 2
                path.insert(0, at: 0)
            }
        }
        
        var node = root
        for p in path { node = p == 0 ? node?.left : node?.right }
        return node != nil
    }
    
    
    private func recover(_ node: TreeNode?) {
        guard let node = node else { return }

        node.left?.val = 2 * node.val + 1
        node.right?.val = 2 * node.val + 2
        
        recover(node.left)
        recover(node.right)
    }

}

/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */
