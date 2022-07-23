class Solution {
    var ans: Set<String> = Set()


    func numTilePossibilities(_ tiles: String) -> Int {
        recursive("", Array(tiles))
        return ans.count
    }
    
    
    func recursive(_ prefix: String, _ tiles: [Character]) {
        for i in 0..<tiles.count {
            let tile = tiles[i]
            let prefix = prefix + String(tile)
            ans.insert(prefix)
            var copy = tiles
            copy.remove(at: i)
            recursive(prefix, copy)
        }    
    }
}
