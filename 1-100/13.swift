class Solution {
     func romanToInt(_ s: String) -> Int {
		var num: Int = 0
		var prev: Character = " "
		let map: [Character : Int] = [
			"I": 1,
			"V": 5,
			"X": 10,
			"L": 50,
			"C": 100,
			"D": 500,
			"M": 1000,
		]
		        
		for c in s {
			if prev == "I" && (c == "V" || c == "X") {
				num += (map[c]! - 2 * map[prev]!)
			} else if prev == "X" && (c == "L" || c == "C") {
				num += (map[c]! - 2 * map[prev]!) 
			} else if prev == "C" && (c == "D" || c == "M") {
				num += (map[c]! - 2 * map[prev]!)
			} else {
				num += map[c]!
			}
			prev = c
		}
        
        return num
    }
    
}
