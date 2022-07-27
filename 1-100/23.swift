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
      func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        let n = lists.count
        var lists = lists
        var interval = 1
        
        while interval < n {
            var i = 0
            while i + interval < n {
                lists[i] = mergeTwoLists(lists[i], lists[i + interval])
                i += interval * 2
            }
            interval *= 2
        }
        
        return lists[0]
    }
    
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            if let l1Val = l1?.val, let l2Val = l2?.val {
                if l1Val < l2Val {
                    cur?.next = l1
                    l1 = l1?.next
                } else {
                    cur?.next = l2
                    l2 = l2?.next
                }
                
            } else if l1 != nil {
                cur?.next = l1
                l1 = l1?.next
            } else if l2 != nil {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        
        return dummy.next
    }
}
