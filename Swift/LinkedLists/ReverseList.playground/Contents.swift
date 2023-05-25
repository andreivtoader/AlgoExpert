import UIKit

class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
    }
}

func reverseLinkedList(_ head: LinkedList) -> LinkedList {
    var previous: LinkedList?
    var current: LinkedList? = head
    
    while current != nil {
        let next: LinkedList? = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    
    return previous!
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

//printList(listOne)

let reversedList = reverseLinkedList(listOne)
printList(reversedList)

