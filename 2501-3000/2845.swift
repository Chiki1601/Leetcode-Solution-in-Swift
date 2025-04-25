class Solution {
    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int64 {
    var cnt = [0: 1]
    var res: Int64 = 0
    var prefix = 0
    for num in nums {
        if num % modulo == k { prefix += 1 }
        let target = (prefix - k + modulo) % modulo
        res += Int64(cnt[target, default: 0])
        cnt[prefix % modulo, default: 0] += 1
    }
    return res
}
}
