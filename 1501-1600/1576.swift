class Solution {
   
    func modifyString(_ s: String) -> String {
        var chars = [Character](s)
        let n = chars.count
        let letters = [Character]("abcdefghijklmnopqrstuvwxyz")

        func change(_ index: Int) {
            let left: Character? = index == 0 ? nil : chars[index - 1]
            let right: Character? = index == n - 1 ? nil : (chars[index + 1] == "?" ? nil : chars[index + 1])
            for letter in letters {
                var flag = true
                if let l = left, l == letter { flag = false }
                if let r = right, r == letter { flag = false }
                if flag { chars[index] = letter; return }
            }
        }

        for i in 0..<n where chars[i] == "?" { change(i) }
        return String(chars)
    }
}
