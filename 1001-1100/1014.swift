class Solution {
  func maxScoreSightseeingPair(_ values: [Int]) -> Int {
    var max = 0, score = values[0];
    for i in 1..<values.count {
      score -= 1;
      if (score + values[i] > max) {
        max = score + values[i];
      }
      if (values[i] > score) {
        score = values[i];
      }
    }
    return max;
  }
}
