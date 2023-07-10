import UIKit

class Program {
  func transposeMatrix(_ matrix: [[Int]]) -> [[Int]] {
      var transposedMatrix = [[Int]]()
      
      for col in 0..<matrix[0].count {
          var newRow = [Int]()
          for row in 0..<matrix.count {
              newRow.append(matrix[row][col])
          }
          transposedMatrix.append(newRow)
      }
      
      return transposedMatrix
  }
}

var input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//var expected = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
var actual = Program().transposeMatrix(input)

print(actual)
