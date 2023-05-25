import UIKit


class Program {
    func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        var searchMap = [Int: Bool]()
        
        for i in 0 ..< array.count {
            if let entry = searchMap.first(where: { $0.key + array[i] == targetSum}) {
                return [array[i], entry.key]
            } else {
                searchMap[array[i]] = true
            } 
        }
        
        return []
    }
}

var array = [3, 5, -4, 8, 11, 1, -1, 6]
var actual = Program().twoNumberSum(&array, 10)

print(actual)
