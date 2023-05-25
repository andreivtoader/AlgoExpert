import UIKit

class Program {
  func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
      array.sort()
      
      var returnArray = [[Int]]()
      var index = 0
      
      while index < array.count - 2 {
          var start = index + 1
          var end = array.count - 1
          
          while start < end {
              let sum = array[index] + array[start] + array[end]
              if sum > targetSum {
                  end -= 1
              } else if sum < targetSum {
                  start += 1
              } else {
                  returnArray.append([array[index], array[start], array[end]])
                  start += 1
                  end -= 1
              }
          }
          index += 1
      }
      
      return returnArray
  }
}


var array = [12, 3, 1, 2, -6, 5, -8, 6]
let threeNumberSumResult = Program().threeNumberSum(array: &array, targetSum: 0)
print(threeNumberSumResult)
//expected: [-8, 2, 6], [-8, 3, 5], [-6, 1, 5]
