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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil { return l2 }
		if l2 == nil { return l1 }
        
		if l1!.val < l2!.val 
			 { l1!.next = mergeTwoLists(l1!.next, l2); return l1 } 
		else { l2!.next = mergeTwoLists(l2!.next, l1); return l2 }
    }
}
