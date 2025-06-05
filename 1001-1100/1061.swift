class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let s1 = Array(s1.utf8).map{Int($0)-97}, s2 = Array(s2.utf8).map{Int($0)-97}, base = Array(baseStr.utf8).map{Int($0)-97}
        let uf = UnionFind(26)
        for i in s1.indices { uf.union(s1[i], s2[i]) }
        var unionMin = [Int: Int]()
        for i in 0..<26 {
            unionMin[uf.find(i)] = min(unionMin[uf.find(i), default: .max], i)
        }
        return String(base.map { Character(UnicodeScalar(unionMin[uf.find($0)]!+97)!) })
    }
}

class UnionFind {
    var parent: [Int]
    var size: [Int]

    init(_ n: Int) {
        parent = [Int](0..<n)
        size = [Int](repeating: 1, count: n)
    }

    func union(_ x: Int, _ y: Int) {
        let rx = find(x), ry = find(y)
        if rx == ry { return }
        if size[rx] < size[ry] {
            parent[rx] = ry
            size[ry] += size[rx]
        } else {
            parent[ry] = rx
            size[rx] += size[ry]
        }
    }

    func find(_ x: Int) -> Int {
        if parent[x] != x { parent[x] = find(parent[x]) }
        return parent[x]
    }
}
