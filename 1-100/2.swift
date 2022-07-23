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

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummyHead = ListNode(-1)
        var tail: ListNode? = dummyHead
        var carry = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            var value = carry
            
            if let l1Val = l1?.val {
                value += l1Val
                l1 = l1?.next
            }
            
            if let l2Val = l2?.val {
                value += l2Val
                l2 = l2?.next
            }
            
            let digit = value % 10
            carry = value / 10
            tail?.next = ListNode(digit)
            tail = tail?.next
        }
        
        return dummyHead.next
    }

}
