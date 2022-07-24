class Solution {
   func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let m = box.count
        let n = box[0].count
        var ans = [[Character]](repeating: [Character](repeating: " ", count: m), count: n)
        for r in 0..<m {
            let rel = getCol(from: box[r])
            for idx in 0..<n { ans[idx][m - 1 - r] = rel[idx] }
        }
        return ans
    }


    private func getCol(from row: [Character]) -> [Character] {
        let m = row.count
        var preffix = [0]
        var cnt = 0
        var ans = [Character](repeating: ".", count: m)
        
        for ch in row {
            if ch == "#" {
                cnt += 1
            } else if ch == "*" {
                cnt = 0
            }
            preffix.append(cnt)   
        }

        for idx in 0..<m {
            if row[idx] ==  "*" {
                if preffix[idx] > 0 {
                    for i  in 0..<preffix[idx] { ans[idx - 1 - i] = "#" }
                }
                ans[idx] = "*"
            } else if idx  == m - 1 {
                if preffix[idx + 1]  >  0  {
                    for i in 0..<preffix[idx + 1] { ans[idx - i] = "#" }
                }
            }
        }
        return ans
    }
    
}
