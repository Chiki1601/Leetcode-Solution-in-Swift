class Solution {
    func isPossibleToSplit(_ n: [Int]) -> Bool {
        [Int:Int](n.map{($0,1)}){$0+$1}.first{$1>2}==nil
    }
}
