import UIKit

class Program {
  func sortedSquaredArray(_ array: [Int]) -> [Int] {
      return array.map { $0*$0 }.sorted()
  }
}

var input = [1, 2, 3, 5, 6, 8, 9]
print(Program().sortedSquaredArray(input))
