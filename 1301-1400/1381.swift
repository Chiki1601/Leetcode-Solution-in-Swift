
class CustomStack {

    
    var stack = [Int]()
    var maxSize: Int
    

    init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    

    func push(_ x: Int) {
        guard stack.count < maxSize else { return }
        stack.append(x)
    }
    

    func pop() -> Int {
        stack.isEmpty ? -1 : stack.removeLast()
    }

    
    func increment(_ k: Int, _ val: Int) {
        for i in 0..<min(k,stack.count) { stack[i] += val  }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */
