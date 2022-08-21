class Solution {
        func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
        let m = stamp.count
        let n = target.count

        var stamp = Array(stamp)
        var target = Array(target)

        var queue = [Int]() // use to memo cannot fully replaced element
        var done = Array(repeating: false, count: n) // true - if already replaced
        var res = [Int]() // result stamp order
        var arr = [Node]()  // help checking remaining todo element in this window
        for i in 0...(n - m) {
            // for each window [i, i+m)
            // arr[i] contain info what needs to change before
            // we can reverse stamp at this window
            var made = Set<Int>()
            var todo = Set<Int>()

            for j in 0..<m {
                if target[i + j] == stamp[j] {
                    made.insert(i + j)
                } else {
                    todo.insert(i + j)
                }
            }

            arr.append(Node(made: made, todo: todo))
            if todo.isEmpty {
                res.insert(i, at: 0)
                for j in i..<i + m {
                    queue.append(j)
                    done[j] = true
                }
            }
        }

        while !queue.isEmpty {
            let i = queue.removeFirst()
            for j in max(0, i - m + 1)...min(n - m, i) {
                if arr[j].todo.contains(i) {
                    arr[j].todo.remove(i)
                    if arr[j].todo.isEmpty {
                        res.insert(j, at: 0)
                        for m in arr[j].made {
                            if !done[m] {
                                queue.append(m)
                                done[m] = true
                            }
                        }
                    }
                }
            }
        }

        for d in done where !d { return [] }
        return res
    }
}


class Node {
    var made = Set<Int>()
    var todo = Set<Int>()


    init(made: Set<Int>, todo: Set<Int>) {
        self.made = made
        self.todo = todo
    } 
    
}
