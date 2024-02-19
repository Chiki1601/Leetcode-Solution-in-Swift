class Solution {

    class Node {
        let char: Int
        var next: [Int : Node]
        var isTerminal: Bool
        
        init(char: Int, next: [Int : Node] = [:], isTerminal: Bool = false) {
            self.char = char
            self.next = next
            self.isTerminal = isTerminal
        }
    } // Trie Node

    class Trie {
        let root = Node(char: -1, next: [:])
        
        func addNumberToTrie(_ n: Int) {
            let n = String(n)
            var tempRoot = root
            for i in n {
                let num = Int(String(i)) ?? 0
                if let _ = tempRoot.next[num] {}
                else {
                    let newNode = Node(char: num)
                    tempRoot.next[num] = newNode
                }
                
                tempRoot = tempRoot.next[num] ?? tempRoot
            }
            
            tempRoot.isTerminal = true
        }
        
        func getPrefixCount(_ n: Int) -> Int {
            let n = String(n)
            var tempRoot = root
            var count = 0
            for i in n {
                let num = Int(String(i)) ?? 0
                if let next = tempRoot.next[num] {
                    count += 1
                    tempRoot = next
                }
                else {
                    break
                }
            }
            return count
        }
    }
    //N : Length of arr1
    //M : Length of arr2
    //A : Lenght of integer of arr1 & arr2 (Can be ignored as its 10^8 => 8 will lead to constant)
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var ans = 0
        let trie = Trie()
        
        for i in arr2 {
            trie.addNumberToTrie(i)
        } //O(M * A)
        
        for i in arr1 {
            let prefixCount = trie.getPrefixCount(i)
            ans = ans < prefixCount ? prefixCount : ans
        } //O(N * A)
        
        return ans
    }
    //Time Complexity: O((M+N) * A)
    //Space Complexity: O(M * A)
}
