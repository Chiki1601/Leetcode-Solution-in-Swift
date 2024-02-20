class Solution {
   func missingNumber(_ nums: [Int]) -> Int {
let sum = nums.reduce(0, +)
let all = nums.count * (nums.count + 1) / 2
return all - sum
}
}
