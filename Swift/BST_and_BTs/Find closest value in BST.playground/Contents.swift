class Program {
  class BST {
    var value: Int
    var left: BST?
    var right: BST?

    init(value: Int) {
      self.value = value
      left = nil
      right = nil
    }
  }

    func findClosestValueInBST(tree: BST?, target: Int) -> Int {
      var closest = Int.max
      return findClosestValueInBSTHelper(tree, target, &closest)
    }
    
    func findClosestValueInBSTHelper(_ tree: BST?, _ target: Int, _ closest: inout Int) -> Int {
        if tree === nil {
            return closest
        }
        
        if abs(target - closest) > abs(target - tree!.value) {
            closest = tree!.value
        }
        
        if target < tree!.value {
            return findClosestValueInBSTHelper(tree?.left, target, &closest)
        } else if target > tree!.value {
            return findClosestValueInBSTHelper(tree?.right, target, &closest)
        } else {
            return closest
        }
    }
}

let root = Program.BST(value: 10)
root.left = Program.BST(value: 5)
root.left!.left = Program.BST(value: 2)
root.left!.left!.left = Program.BST(value: 1)
root.left!.right = Program.BST(value: 5)
root.right = Program.BST(value: 15)
root.right!.left = Program.BST(value: 13)
root.right!.left!.right = Program.BST(value: 14)
root.right!.right = Program.BST(value: 22)
//let expected = 13
let actual = Program().findClosestValueInBST(tree: root, target: 12)

print(actual)

