class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var nBytes = 0
        let mask1 = 1 << 7
        let mask2 = 1 << 6

        for num in data {
            var mask = 1 << 7
            if nBytes == 0 {
                while mask & num != 0 {
                    nBytes += 1
                    mask = mask >> 1
                }

                if nBytes == 0 { continue }
                if nBytes == 1 || nBytes > 4 { return false }
            } else {
                if !(num & mask1 != 0 && mask2 & num == 0) { return false }
            }
            nBytes -= 1
        }

        return nBytes == 0
    }
}
