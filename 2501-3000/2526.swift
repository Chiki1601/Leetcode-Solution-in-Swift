class DataStream {

    let value: Int
    let k: Int
    var numOccurrences: Int

    init(_ value: Int, _ k: Int) {
        self.value = value
        self.k = k
        self.numOccurrences = 0
    }

    func consec(_ num: Int) -> Bool {
        if num == value {
            numOccurrences += 1
        } else {
            numOccurrences = 0
        }

        return numOccurrences >= k
    }
}
