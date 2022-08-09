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
  /**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
   
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var digitals: [Int] = []
        var res: String = ""
        var val = k
        var m = n

        for i in 1...n { digitals.append(i) }

        while res.count < n && val > 0 {
            let i = Int(ceil(Double(val) / Double(permutation(m - 1))))
            res += "\(digitals[i-1])"
            print(i, digitals)
            digitals.remove(at: i - 1)
            val -= (i - 1) * permutation(m - 1)
            m -= 1
        }
        return res
    }


    func permutation(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var res = 1
        for i in 1...n { res *= i }
        return res
    }
    
}
}
