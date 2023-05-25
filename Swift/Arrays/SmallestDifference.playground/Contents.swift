import UIKit

class Program {
  func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
      arrayOne.sort()
      arrayTwo.sort()
      
      var indexOne = 0
      var indexTwo = 0
      var absoluteDifference = Int(INT_MAX)
      var returnArray = [Int]()
      
      while indexOne < arrayOne.count, indexTwo < arrayTwo.count {
          let currentAbsoluteDifference = abs(arrayOne[indexOne] - arrayTwo[indexTwo])
          print(currentAbsoluteDifference)
          
          if currentAbsoluteDifference < absoluteDifference {
              returnArray.removeAll()
              absoluteDifference = currentAbsoluteDifference
              returnArray.append(arrayOne[indexOne])
              returnArray.append(arrayTwo[indexTwo])
          }
          
          if arrayOne[indexOne] < arrayTwo[indexTwo] {
              indexOne += 1
          } else {
              indexTwo += 1
          }
      }
      
      return returnArray
  }
}

var firstArray = [-1, 5, 10, 20, 28, 3]
var secondArray = [26, 134, 135, 15, 17]
let difference = Program().smallestDifference(arrayOne: &firstArray, arrayTwo: &secondArray)
print(difference)
