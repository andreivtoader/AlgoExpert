import UIKit

class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
    }
}

func sumOfLinkedLists(_ linkedListOne: LinkedList, _ linkedListTwo: LinkedList) -> LinkedList? {
    var first: LinkedList? = linkedListOne
    var second: LinkedList? = linkedListTwo
    var linkedListSumHeadPointer: LinkedList? = LinkedList(value: 0)
    var current: LinkedList? = linkedListSumHeadPointer
    var carry = 0
    
    while first != nil || second != nil || carry != 0 {
        let firstValue = first?.value ?? 0
        let secondValue = second?.value ?? 0
        
        let sumOfValues = firstValue + secondValue + carry
        let newValue = sumOfValues % 10
        var newNode = LinkedList(value: newValue)
        current?.next = newNode
        current = newNode
        carry = sumOfValues / 10
        
        first = first?.next
        second = second.ne
    }
    
    
    return linkedListSumHeadPointer?.next
}

func printList(_ list: LinkedList) {
    var current: LinkedList? = list
    while current != nil {
        print("Node: \(current?.value)")
        current = current?.next
    }
}

var list = LinkedList(value: 2)
list.next = LinkedList(value: 4)
list.next?.next = LinkedList(value: 7)
list.next?.next?.next = LinkedList(value: 1)

var listTwo = LinkedList(value: 9)
listTwo.next = LinkedList(value: 4)
listTwo.next?.next = LinkedList(value: 5)

//printList(list)
//printList(listTwo)
//
var sumoflists = sumOfLinkedLists(list, listTwo)
printList(sumoflists!)


