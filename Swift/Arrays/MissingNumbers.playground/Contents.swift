import UIKit

class Program {
  func missingNumbers(_ nums: [Int]) -> [Int] {
      let totalShouldHaveSize = nums.count + 2
      var missing = [Int]()
      
      for i in 1...totalShouldHaveSize {
          if nums.contains(i) {
              continue
          }
          missing.append(i)
      }
      return missing
  }
}


var input = [4, 5, 1, 3]
var expected = [2, 6]
var actual = Program().missingNumbers(input)
print(actual)
