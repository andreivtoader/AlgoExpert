import UIKit

class Program {
  class BinaryTree {
    var value: Int
    var left: BinaryTree?
    var right: BinaryTree?

    init(value: Int) {
      self.value = value
    }
  }

    static func nodeDepths(_ root: BinaryTree?, _ depth: Int = 0) -> Int {
        if root === nil {
            return 0
        }
        
        return depth + nodeDepths(root?.left, depth + 1) + nodeDepths(root?.right, depth + 1)
    }
}


var root = Program.BinaryTree(value: 1)
root.left = Program.BinaryTree(value: 2)
root.left!.left = Program.BinaryTree(value: 4)
root.left!.left!.left = Program.BinaryTree(value: 8)
root.left!.left!.right = Program.BinaryTree(value: 9)
root.left!.right = Program.BinaryTree(value: 5)
root.right = Program.BinaryTree(value: 3)
root.right!.left = Program.BinaryTree(value: 6)
root.right!.right = Program.BinaryTree(value: 7)
let actual = Program.nodeDepths(root)
print(actual)

