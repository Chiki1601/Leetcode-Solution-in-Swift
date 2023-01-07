class Solution {
  func canCompleteCircuit(_ g: [Int], _ c: [Int]) -> Int {
    [zip(g,c).map{$0.0-$0.1}.enumerated().reduce(into:(0,0,0)){$0.0+=$1.1;$0.1+=$1.1;if $0.1<0 {$0.1=0;$0.2=$1.0+1}}].map{$0.0>=0 ? $0.2:-1}[0]
  }
}
