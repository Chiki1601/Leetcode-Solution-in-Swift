class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for x in nums {
            var cur = x
            while let last = res.last, gcd(last, cur) > 1 {
                cur = lcm(last, cur)
                res.removeLast()
            }
            res.append(cur)
        }
        return res
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return a
    }

    func lcm(_ a: Int, _ b: Int) -> Int {
        a / gcd(a, b) * b
    }
}
