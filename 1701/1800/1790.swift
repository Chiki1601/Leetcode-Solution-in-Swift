class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        s1.sorted() == s2.sorted() && zip(s1, s2).filter(!=).count <= 2
    }
}
