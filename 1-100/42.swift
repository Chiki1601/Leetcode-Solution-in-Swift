class Solution {
      func trap(_ height: [Int]) -> Int {
        func subtrap(_ height: [Int], _ i: Int, _ j: Int) -> Int {
            var max = 0
            var iMax = i
            var jMax = j
            var iTmp = i
            var jTmp = j

            while iTmp < jTmp {
                let area = (jTmp - iTmp - 1) * min(height[iTmp], height[jTmp])
                if area > max {
                    max = area
                    iMax = iTmp
                    jMax = jTmp
                }
                if height[iTmp] < height[jTmp] {
                    iTmp += 1
                } else {
                    jTmp -= 1
                }
            }

            if max == 0 {
                return 0
            } else {
                for k in iMax+1..<jMax {
                    let h = min(height[iMax], height[jMax])
                    max -= (height[k] > h ? h : height[k])
                }
                var extra = -1
                var tmpHeight = 0
                for k in iMax+1...jMax-1 {
                    if height[k] > min(height[iMax], height[jMax]) && height[k] > tmpHeight {
                        tmpHeight = height[k]
                        extra = k
                    }
                }
                if extra >= 0 { max = subtrap(height, iMax, extra) + subtrap(height, extra, jMax) }
                return max + subtrap(height, i, iMax) + subtrap(height, jMax, j)
            }
        }
        return subtrap(height, 0, height.count - 1)
    }

}
