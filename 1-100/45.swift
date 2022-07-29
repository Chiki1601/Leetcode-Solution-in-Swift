class Solution {
   
    func jump(_ nums: [Int]) -> Int {
		guard nums.count > 1 else { return 0 }
		var maxIndex: [Int] = [1]

		for i in 0..<nums.count {
			var max = 0

			for j in 0..<maxIndex[i] {
				if (j >= nums.count) { break }
				let index = j + nums[j] + 1

				max = max > index ? max : index
				if max >= nums.count { return i + 1 }
			}

			maxIndex.append(max)
		}
        return 0
    }
    
}
