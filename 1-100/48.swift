class Solution {
      func rotate(_ matrix: inout [[Int]]) {
        let times = matrix.count / 2

		for i in 0..<times {
			for j in 0..<matrix.count - i * 2 - 1 {
				let i1 = i
				let i2 = i + j
				let i3 = matrix.count - i - 1
				let i4 = matrix.count - i - 1 - j
				let j1 = i + j
				let j2 = matrix.count - i - 1
				let j3 = matrix.count - i - 1 - j
				let j4 = i
				let n1 = matrix[i1][j1]
				let n2 = matrix[i2][j2]
				let n3 = matrix[i3][j3]
				let n4 = matrix[i4][j4]
				matrix[i1][j1] = n4
				matrix[i2][j2] = n1
				matrix[i3][j3] = n2
				matrix[i4][j4] = n3
			}	
		}
    }

}
