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
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head

        var curr = dummy
        while let nextVal = curr?.next?.val, let nextNextVal = curr?.next?.next?.val {
            if nextVal == nextNextVal {
                let duplicate = nextVal
                while curr?.next != nil, curr?.next?.val == duplicate {
                    curr?.next = curr?.next?.next
                }
            } else {
                curr = curr?.next
            }
        }

        return dummy?.next
    }

}
