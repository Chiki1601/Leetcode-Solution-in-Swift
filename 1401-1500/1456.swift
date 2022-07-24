class Solution {
     func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowelLetters = ["a","e","i","o","u"]
        var tmp = [Int] ()
        var max = 0
        var diff = 0
        
        for char in s {
            let value = vowelLetters.contains(String(char)) ? 1 : 0
            tmp.append(value)
            diff += value
            
            if tmp.count > k { diff -= tmp.removeFirst() }
            if diff > max { max = diff }
        }
        
        return max
    }
}
