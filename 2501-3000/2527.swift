class Solution {

    func xorBeauty(_ nums: [Int]) -> Int {
        var xor = 0
        for num in nums {
            xor ^= num
        }
        return xor
    }
}
