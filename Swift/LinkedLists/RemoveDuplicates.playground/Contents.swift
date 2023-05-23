import UIKit

// This is an input class. Do not edit.
class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
    }
}

func removeDuplicatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {
    var current: LinkedList? = linkedList

    while current != nil {
        var nextDistinctNode = current!.next
        while nextDistinctNode != nil, nextDistinctNode!.value == current!.value {
            nextDistinctNode = nextDistinctNode!.next
        }
        current!.next = nextDistinctNode
        current = nextDistinctNode
    }
    
    return linkedList
}

func printList(_ linkedList: LinkedList) {
    var currentNode: LinkedList? = linkedList
    
    while currentNode != nil {
        print("Node: \(currentNode!.value)")
        currentNode = currentNode?.next
    }
}

var list = LinkedList(value: 1)
list.next = LinkedList(value: 1)
list.next?.next = LinkedList(value: 3)
list.next?.next?.next = LinkedList(value: 4)
list.next?.next?.next?.next = LinkedList(value: 4)
list.next?.next?.next?.next?.next = LinkedList(value: 4)
list.next?.next?.next?.next?.next?.next = LinkedList(value: 5)
list.next?.next?.next?.next?.next?.next?.next = LinkedList(value: 6)
list.next?.next?.next?.next?.next?.next?.next?.next = LinkedList(value: 6)

printList(list)
removeDuplicatesFromLinkedList(list)
print("\nAfter removing the duplicates:\n")
printList(list)




