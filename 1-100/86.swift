/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
       func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var current = head
        var left_nodes: [ListNode?] = []
        var right_nodes: [ListNode?] = []
        var head: ListNode?
        var prev: ListNode?
        
        while current != nil {
            if current!.val < x {
                left_nodes.append(current)
            } else {
                right_nodes.append(current)
            }
            
            current = current?.next
        }
        
        for node in left_nodes + right_nodes {
            node?.next = nil
            
            if head == nil {
                head = node
            } else {
                prev?.next = node
            }
            
            prev = node
        }
        
        return head
    }

}
