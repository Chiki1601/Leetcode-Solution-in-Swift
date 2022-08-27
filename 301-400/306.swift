class Solution {
      func isAdditiveNumber(_ num: String) -> Bool {
        let num = Array(num)
        var res = false

        checkHelper(num, 0, &res)
        return res
    }

    
    private func checkHelper(_ num: [Character], _ offset: Int, _ res: inout Bool) {
        var i = offset
        while i < num.count && (i == offset || num[offset] != "0") {
            let first: [Character] = Array(num[offset...i])

            var j = i + 1
            while j < num.count && (j == i+1 || num[i+1] != "0") {
                let second: [Character] = Array(num[i+1...j])
                backtrace(num, j+1, first, second, &res)
                j += 1
            }

            i += 1
        }
    }
    

    private func backtrace(_ num: [Character], _ offset: Int, _ first: [Character], _ second: [Character], _ res: inout Bool) {
        let sum = sumNumberStr(first, second)
        var k = 0
        while k < sum.count && offset + k < num.count {
            if sum[k] == num[offset+k] {
                k += 1
            } else {
                break
            }
        }

        if k == sum.count {
            if offset+k == num.count {
                res = true
                return
            } else {
                backtrace(num, offset + k, second, sum, &res)
            }
        }
    }


    private func sumNumberStr(_ a: [Character], _ b: [Character]) -> [Character] {
        let aLen = a.count
        let bLen = b.count
        if aLen < bLen { return sumNumberStr(b, a) }

        let a = Array(a.reversed())
        let b = Array(b.reversed())

        var carry = 0
        var res: [Character] = Array(repeating: "0", count: a.count)

        var i = 0
        while i < b.count {
            let sum = Int(a[i].asciiValue! + b[i].asciiValue! - 2*Character("0").asciiValue!)
            res[i] = Character(String((sum + carry) % 10))
            carry = (sum + carry) / 10
            i += 1
        }

        while i < a.count {
            let sum = Int(a[i].asciiValue! - Character("0").asciiValue!)
            res[i] = Character(String((sum + carry) % 10))
            carry = (sum + carry) / 10
            i += 1
        }

        if carry > 0 { res.append("1") }
        return res.reversed()
    }
}
