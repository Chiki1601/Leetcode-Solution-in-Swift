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
      func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var tmp1: ListNode? = head
        
        for _ in 0..<k - 1 { tmp1 = tmp1?.next }
        if tmp1 == nil {
            return head
        } else {
            var current: ListNode?
            var tmp2: ListNode?
            
            for _ in 0..<k {
                if current == nil {
                    current = head?.next
                    head?.next = reverseKGroup(tmp1?.next, k)
                    tmp1 = head
                } else {
                    tmp2 = current?.next
                    current?.next = tmp1
                    tmp1 = current
                    current = tmp2
                }
            }
            return tmp1
        }
    }

}
