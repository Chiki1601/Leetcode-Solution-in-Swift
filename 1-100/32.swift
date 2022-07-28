class Solution {
        func longestValidParentheses(_ s: String) -> Int {
		var string = Array(s)


		func reverse(_ string: [Character]) -> [Character] {
			var res: [Character] = []
			for c in string.reversed() { res.append(c == "(" ? ")" : "(") }
			return res
		}
		

		func _max(_ string: [Character]) -> Int {
			var max = 0
			var tmp = 0
			var lastContinuousIndex = 0
			var stack: [Character] = []

			for (i, c) in string.enumerated() {
				if c == "(" {
					if stack.count == 0 { lastContinuousIndex = i }
					stack.append(c)
				} else {
					let index = stack.count - 1
					if index >= 0 && stack[index] == "(" {
						stack.remove(at: index)
						tmp += 2
						max = tmp > max ? tmp : max  
					} else {
						stack.removeAll()
						tmp = 0
					}
				}
			}

			if (stack.count == 0) {
				return max
			} else {
				let a = _max(Array(string[0..<lastContinuousIndex]))
				let b =  _max(reverse(Array(string[lastContinuousIndex..<string.count])))
				return a > b ? a : b
			}
		}
		return _max(string)
    }
}
