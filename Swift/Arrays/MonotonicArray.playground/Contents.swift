import UIKit

class Program {
  func isMonotonic(array: [Int]) -> Bool {
      if array.count <= 2 {
          return true
      }
      
      var isNonDecreasing = true
      var isNonIncreasing = true
      
      for i in 1..<array.count {
          if array[i] < array[i-1] {
              isNonDecreasing = false
          }
          if array[i] > array[i-1] {
              isNonIncreasing = false
          }
      }
      
      return isNonDecreasing || isNonIncreasing
  }
}

let array = [1, 1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 7, 9, 10, 11]
let actual = Program().isMonotonic(array: array)

print(actual)
