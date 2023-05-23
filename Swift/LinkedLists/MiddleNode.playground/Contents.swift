import UIKit

class LinkedList: Hashable {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
}

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }

    static func == (left: LinkedList, right: LinkedList) -> Bool {
        return left === right
    }
}

func middleNode(_ linkedList: LinkedList) -> LinkedList? {
    var currentNode: LinkedList? = linkedList
    
    var totalSize = 0
    while currentNode != nil {
        totalSize += 1
        currentNode = currentNode!.next
    }
    
    currentNode = linkedList
    
    for _ in 0..<(totalSize/2) {
        currentNode = currentNode!.next
    }

    return currentNode
}


