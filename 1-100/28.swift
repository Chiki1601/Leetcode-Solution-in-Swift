class Solution {
        func strStr(_ haystack: String, _ needle: String) -> Int {
		guard haystack.count >= needle.count else { return -1 }
		let chars1 = Array(haystack)
		let chars2 = Array(needle)
		
        for i in 0..<chars1.count - chars2.count + 1 {
			var count = 0
			for j in 0..<chars2.count {
				if chars1[i + j] != chars2[j] { break }
				count += 1
			}
			if count == chars2.count {
				return i
			} else {
				continue
			}
		}
        return -1
    }

}
