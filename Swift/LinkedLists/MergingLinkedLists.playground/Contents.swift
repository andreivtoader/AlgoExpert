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

func mergingLinkedLists(_ linkedListOne: LinkedList, _ linkedListTwo: LinkedList) -> LinkedList? {
    var searchMap = [Int: LinkedList?]()
    var first: LinkedList? = linkedListOne
    var second: LinkedList? = linkedListTwo
    
    while first != nil {
        let value = first!.value
        searchMap[value] = first
        
        first = first?.next
    }
    
    while second != nil {
        let value = second!.value
        let valueExists = searchMap[value] != nil
        
        if valueExists {
            return second
        }
        
        second = second?.next
    }
    
    return nil
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

var listOne = two
listOne.next = three
listOne.next?.next = one
listOne.next?.next?.next = four

var listTwo = eight
listTwo.next = seven
listTwo.next?.next = one
listTwo.next?.next?.next = four

printList(mergingLinkedLists(listOne, listTwo)!)
