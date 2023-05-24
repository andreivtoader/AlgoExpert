import UIKit

class LinkedList {
    var value: Int?
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
}

func removeKthNodeFromEnd(head: LinkedList, k: Int) {
    var firstPointer: LinkedList? = head
    var secondPointer: LinkedList? = head
    var counter = 1
    
    while counter <= k {
        secondPointer = secondPointer?.next
        counter += 1
    }
    
    if secondPointer?.next == nil {
        head.value = head.next?.value
        head.next = head.next?.next
    }
    
    while secondPointer?.next != nil {
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    
    firstPointer?.next = firstPointer?.next?.next
}

func printList(_ linkedList: LinkedList) {
    var currentNode: LinkedList? = linkedList
    
    while currentNode != nil {
        print("Node: \(currentNode!.value!)")
        currentNode = currentNode?.next
    }
}

var list = LinkedList(value: 0)
list.next = LinkedList(value: 1)
list.next?.next = LinkedList(value: 2)
list.next?.next?.next = LinkedList(value: 3)
list.next?.next?.next?.next = LinkedList(value: 4)
list.next?.next?.next?.next?.next = LinkedList(value: 5)
list.next?.next?.next?.next?.next?.next = LinkedList(value: 6)
list.next?.next?.next?.next?.next?.next?.next = LinkedList(value: 7)
list.next?.next?.next?.next?.next?.next?.next?.next = LinkedList(value: 8)
list.next?.next?.next?.next?.next?.next?.next?.next?.next = LinkedList(value: 9)

printList(list)

print("\nAfter removal...\n")

removeKthNodeFromEnd(head: list, k: 4)
printList(list)


