import UIKit

class Program {
  static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
      var sequenceIndex = 0
      
      for i in 0 ..< array.count {
          if sequenceIndex < sequence.count, array[i] == sequence[sequenceIndex] {
              sequenceIndex += 1
          }
          
      }
      
      return sequenceIndex == sequence.count
  }
}


let array = [5, 1, 22, 25, 6, -1, 8, 10]
let sequence = [1]
print(Program.isValidSubsequence(array, sequence))

