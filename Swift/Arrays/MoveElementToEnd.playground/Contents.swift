import UIKit

class Program {
  func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
      array.sort()
      var start = 0
      var end = array.count - 1
      
      while start < end {
          if array[start] == toMove {
              array.swapAt(start, end)
              end -= 1
          }
          start += 1
      }
      
      return array
  }
}

var array = [2, 1, 2, 2, 2, 3, 4, 2]
let toMove = 2
let output = Program().moveElementToEnd(&array, toMove)
print(output)
