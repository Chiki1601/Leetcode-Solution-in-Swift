struct Mat {
    var a: [[Int]]
    let MOD = 1_000_000_007
    let size = 26

    init() {
        a = [[Int]](repeating: [Int](repeating: 0, count: 26), count: 26)
    }

    init(copyFrom: Mat) {
        a = copyFrom.a.map { $0.map { $0 } }
    }

    static func * (lhs: Mat, rhs: Mat) -> Mat {
        var result = Mat()
        for i in 0..<26 {
            for k in 0..<26 where lhs.a[i][k] != 0 {
                for j in 0..<26 {
                    result.a[i][j] += lhs.a[i][k] * rhs.a[k][j]
                    result.a[i][j] %= result.MOD
                }
            }
        }
        return result
    }
}

func identityMatrix() -> Mat {
    var m = Mat()
    for i in 0..<26 {
        m.a[i][i] = 1
    }
    return m
}

func quickMul(_ x: Mat, _ y: Int) -> Mat {
    var ans = identityMatrix()
    var cur = x
    var exponent = y
    while exponent > 0 {
        if exponent & 1 != 0 {
            ans = ans * cur
        }
        cur = cur * cur
        exponent >>= 1
    }
    return ans
}

class Solution {
    func lengthAfterTransformations(_ s: String, _ t: Int, _ nums: [Int]) -> Int {
        let MOD = 1_000_000_007
        var T = Mat()
        
        // Build transformation matrix
        for i in 0..<26 {
            for j in 1...nums[i] {
                let targetRow = (i + j) % 26
                T.a[targetRow][i] = 1
            }
        }
        
        // Matrix exponentiation
        let res = quickMul(T, t)
        
        // Calculate initial frequency
        var freq = [Int](repeating: 0, count: 26)
        for char in s.unicodeScalars {
            let idx = Int(char.value - "a".unicodeScalars.first!.value)
            freq[idx] += 1
        }
        
        // Calculate total combinations
        var total = 0
        for i in 0..<26 {
            for j in 0..<26 {
                total = (total + res.a[i][j] * freq[j]) % MOD
            }
        }
        
        return total
    }
}
