class Solution {
     func replaceElements(_ arr: [Int]) -> [Int] {
        var i = 0
        var maxVal = 0
        var newArr = [Int]()
        let lenght = arr.count

        maxVal = maxValue(arr)
        while i < lenght {
            if arr[i] == maxVal { maxVal = maxValueRight(arr, i, lenght) }
            newArr.append(maxVal)
            i += 1
        }

        newArr[i - 1] = -1
        return newArr
    }


    func maxValueRight(_ array: [Int], _ start: Int, _ end: Int) -> Int {
        var maxVal = 0
        var i = start + 1

        while i < end {
            if array[i] > maxVal { maxVal = array[i] }
            i += 1
        }

        return maxVal
    }


    func maxValue(_ array: [Int]) -> Int {
        var maxVal = 0
        var i = 0
        let lenght = array.count

        while i < lenght {
            if array[i] > maxVal { maxVal = array[i] }
            i += 1
        }

        return maxVal
    }
}
