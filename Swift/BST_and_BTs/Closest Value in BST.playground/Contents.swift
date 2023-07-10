import UIKit

class Program {
  class BST {
    var value: Int
    var left: BST?
    var right: BST?

    init(value: Int) {
      self.value = value
    }
  }

    func branchSums(root: BST) -> [Int] {
        var branchSums = [Int]()
        var runningSum = 0
        
        branchSumsHelper(root, &runningSum, &branchSums)
        
        return branchSums
    }
    
    func branchSumsHelper(_ root: BST, _ runningSum: inout Int, _ output: inout [Int]) {
        var currentSum = runningSum + root.value
        
        if isLeaf(node: root) {
            output.append(currentSum)
            return
        }
        
        if let leftNode = root.left {
            branchSumsHelper(leftNode, &currentSum, &output)
        }
        
        if let rightNode = root.right {
            branchSumsHelper(rightNode, &currentSum, &output)
        }
        
    }
    
    func isLeaf(node: BST) -> Bool {
        return node.left === nil && node.right === nil
    }
}

var tree = Program.BST(value: 1)
tree.left = Program.BST(value: 2)
tree.right = Program.BST(value: 3)
tree.left!.left = Program.BST(value: 4)
tree.left!.right = Program.BST(value: 5)
tree.right!.left = Program.BST(value: 6)
tree.right!.right = Program.BST(value: 7)
tree.left!.left!.left = Program.BST(value: 8)
tree.left!.left!.right = Program.BST(value: 9)
tree.left!.right!.left = Program.BST(value: 10)
//var expected: [Int] = [15, 16, 18, 10, 11]
var output = Program().branchSums(root: tree)
print(output)

