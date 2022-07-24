
class OrderedStream {

     var index = 0
    var n = 0
    var array: [String] = []
    

    init(_ n: Int) {
        self.n = n
        self.array = Array(repeating: "", count: n)
    }
    

    func insert(_ id: Int, _ value: String) -> [String] {
        var chunkStrs:[String] = []    
        self.array[id - 1] = value
        
        while self.index < self.n {
            if self.array[self.index] != ""{
                chunkStrs.append(self.array[self.index])
                self.index += 1
            } else { break }
        }
        return chunkStrs
    }
}

/**
 * Your OrderedStream object will be instantiated and called as such:
 * let obj = OrderedStream(n)
 * let ret_1: [String] = obj.insert(idKey, value)
 */
