
class NumArray {

   
    private var nums: [Int]
    private var blockSums: [Int]


    init(_ nums: [Int]) {
        self.nums = nums
        let blockCount = Int(sqrt(Double(nums.count)).rounded(.up))
        blockSums = [Int](repeating: 0, count: blockCount)

        for (i, num) in nums.enumerated() {
            blockSums[i / blockCount] += num
        }
    }


    func update(_ i: Int, _ val: Int) {
        let blockNum = i / blockSums.count
        blockSums[blockNum] += val - nums[i]
        nums[i] = val
    }


    func sumRange(_ i: Int, _ j: Int) -> Int {
        let blockCount = blockSums.count
        let startBlock = i / blockCount
        let startBlockStartIndex = startBlock * blockCount
        let endBlock = j / blockCount
        let endBlockEndIndex = min(endBlock * blockCount + (blockCount - 1), nums.count - 1)
        
        var blockSum = blockSums[startBlock...endBlock].reduce(0, +)

        for k in startBlockStartIndex..<i { blockSum -= nums[k] }
        for k in stride(from: j + 1, through: endBlockEndIndex, by: 1) { blockSum -= nums[k] }

        return blockSum
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */
