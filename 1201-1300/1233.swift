class Solution {
     func removeSubfolders(_ folder: [String]) -> [String] {
        let folder = folder.sorted()
        var results = [String]()
        var index = folder.startIndex

        while index != folder.endIndex {
            results.append(folder[index])
            let sub = folder[index] + "/"
            guard let next = (index + 1..<folder.endIndex).firstIndex(where: { !folder[$0].starts(with: sub) }) else { break }
            index = next
        }

        return results
    }
}
