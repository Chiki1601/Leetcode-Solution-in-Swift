class Solution {
      func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
        var ans = [String]()
        var record = [String:[Int]]()


        func parseTime(_ timeStr: String) -> Int {
            var time = timeStr
            let hour = Int(String(time[...time.index(after: time.startIndex)]))!
            time.removeFirst(3)
            let min = Int(String(time))!
            return hour * 60 + min
        }

        for idx in 0..<keyName.count { record[keyName[idx], default: []].append(parseTime(keyTime[idx])) }
        for (name, rec) in record {
            let sortedTime = rec.sorted()
            guard sortedTime.count >= 3 else { continue }
            for i in 2..<sortedTime.count where sortedTime[i] - sortedTime[i - 2] <= 60 { ans.append(name); break }
        }
        return ans.sorted()
    }
}
