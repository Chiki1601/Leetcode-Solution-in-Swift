class Solution {
    
    private let THOUSANDS = ["", "Thousand", "Million", "Billion"]
    private let LESSTHAN20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    private let TENS = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        var i = 0
        var words = ""
        var num = num
        
        while num > 0 {
            if num % 1000 != 0 {
                words = helper(num%1000) + THOUSANDS[i] + (i != 0 ? " " : "") + words
            }
            num /= 1000
            i += 1
        }
        
        return String(words.dropLast())
    }
    
    
    private func helper(_ num: Int) -> String {
        if num == 0 {
            return ""
        } else if num < 20 {
            return LESSTHAN20[num] + " "
        } else if num < 100 {
            return TENS[num / 10] + " " + helper(num%10)
        } else {
            return LESSTHAN20[num / 100] + " Hundred " + helper(num % 100)
        }
    }
}
