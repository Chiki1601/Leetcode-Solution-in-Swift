class Solution {
 func isPalindrome(_ x: Int) -> Bool {
		if x < 0 { return false }
		var nums: [Int] = []
		var tmp = x
        
		while tmp > 0 {
			nums.append(tmp % 10)
			tmp = tmp / 10
		}
        
		for (i, num) in nums.enumerated() where nums[nums.count - i - 1] != num { return false }
        return true
    }

}
