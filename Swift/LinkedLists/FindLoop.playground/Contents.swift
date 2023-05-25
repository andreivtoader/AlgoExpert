import UIKit

// This is an input class. Do not edit.
class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
}

func findLoop(head: LinkedList) -> LinkedList? {
    var slow: LinkedList? = head.next
    var fast: LinkedList? = head.next?.next
    
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    slow = head
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next
    }
    return slow
}

func printList(_ list: LinkedList) {
    var current: LinkedList? = list
    while current != nil {
        print("Node: \(current?.value)")
        current = current?.next
    }
}


var one = LinkedList(value: 1)
var two = LinkedList(value: 2)
var three = LinkedList(value: 3)
var four = LinkedList(value: 4)
var seven = LinkedList(value: 7)
var eight = LinkedList(value: 8)

var listOne = one
listOne.next = two
listOne.next?.next = three
listOne.next?.next?.next = four
listOne.next?.next?.next?.next = seven
listOne.next?.next?.next?.next?.next = three

//let loopedList = findLoop(head: listOne)
//printList(loopedList!)


