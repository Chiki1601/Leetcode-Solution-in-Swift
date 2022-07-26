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
   
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        var count = n

        while count > 0 {
            count -= 1
            fast = fast?.next
        }

        if fast == nil { return head?.next }

        while slow != nil && fast != nil {
            if fast?.next == nil { slow?.next = slow?.next?.next } // end
            slow = slow?.next
            fast = fast?.next
        }

        return head
    }

}
