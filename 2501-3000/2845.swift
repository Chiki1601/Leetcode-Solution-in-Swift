class Solution {
    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
        let n = nums.count
        
        var answer = 0
        var count = 0
        var counts: [Int: Int] = [0: 1]

        for right in 0..<n {
            if nums[right] % modulo == k {
                count = (count + 1) % modulo
            }

            let other = (modulo + count - k) % modulo
            answer += counts[other, default: 0]

            counts[count, default: 0] += 1
        }

        return answer
    }
}
