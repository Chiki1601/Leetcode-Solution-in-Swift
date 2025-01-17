class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
     return derived.reduce(0, ^) == 0;   
    }
}
