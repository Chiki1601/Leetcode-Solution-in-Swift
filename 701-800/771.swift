class Solution {
      func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var jewels = Set<Character>()
        for jewel in J { jewels.insert(jewel) }

        var ans = 0
        for stone in S {
            guard jewels.contains(stone) else { continue }
            ans += 1
        }

        return ans
    }

}
