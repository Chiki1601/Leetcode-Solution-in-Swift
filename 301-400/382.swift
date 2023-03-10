class Solution {

    private let head: ListNode?

    init(_ head: ListNode?) {
        self.head = head
    }

    func getRandom() -> Int {
        var i: Int = 0
        var val: Int?
        var node: ListNode? = self.head

        while(node !== nil) {
            i += 1
            if Int.random(in: 1...i) == i {
                val = node!.val
            }
            node = node!.next
        }

        return val!
    }
}
