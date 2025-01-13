class Solution {
  func minimumLength(_ s: String) -> Int {
    guard s.count > 2 else { return s.count }
    return Array(s).reduce(([Character: Int](), 0), { l, c in 
        var (d, r) = l 
        let curr = d[c, default: 0]
        d[c] = ((curr + 1) > 2) ? 1 : (curr + 1)
        r += d[c, default: 0] - curr
        return (d, r)
    }).1
  }
}
