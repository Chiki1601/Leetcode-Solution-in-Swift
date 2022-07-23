class Solution {
     func defangIPaddr(_ address: String) -> String { address.replacingOccurrences(of: ".", with: "[.]") }
}
