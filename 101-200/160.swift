/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
      
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil, headB != nil else { return nil }
        
        var a: ListNode? = headA
        var b: ListNode? = headB
        
        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }
        
        return a
    }
}
