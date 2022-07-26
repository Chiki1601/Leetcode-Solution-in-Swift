class Solution {
      func intToRoman(_ num: Int) -> String {
        let map: [Int: String] = [
			1: "I",
			5: "V",
			10: "X",
			50: "L",
			100: "C",
			500: "D",
			1000: "M"
		]
        var res = ""
        var count = 3
        var rem = num

        while count >= 0 {
            let i = Int(pow(10, Double(count))) // [1000, 100, 10]
            let d = rem / i
            rem = rem % i
            if d == 9 {
                res += map[i]! + map[i * 10]!
            } else if d >= 5 {
                res += map[i * 5]!
                for _ in 0..<d - 5 { res += map[i]! }
            } else if d == 4 {
                res += map[i]! +  map[i * 5]!
            } else if d > 0 {
                for _ in 0..<d { res += map[i]! }
            }
            count -= 1
        }

        return res
    }
}
