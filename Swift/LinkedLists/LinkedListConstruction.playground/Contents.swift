import UIKit

class Node {
    var value: Int
    var previous: Node?
    var next: Node?

    init(value: Int) {
      self.value = value
      previous = nil
      next = nil
    }
}

class DoublyLinkedList {
    var head: Node?
    var tail: Node?

    init() {
      head = nil
      tail = nil
    }

    func containsNodeWithValue(value: Int) -> Bool {
        var node = head
        while node !== nil, node?.value != value {
            node = node?.next
        }
        return node !== nil
    }

    func remove(node: Node) {
        if node === head {
            head = head?.next
        }
        
        if node === tail {
            tail = tail?.previous
        }
        
        removeNodeBindings(node: node)
    }

    func removeNodesWithValue(value: Int) {
        var node = head
        while node !== nil {
            let nodeToRemove = node
            node = node?.next
            
            if nodeToRemove?.value == value {
                remove(node: nodeToRemove!)
            }
        }
    }

    func insertBefore(node: Node, nodeToInsert: Node) {
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        
        remove(node: nodeToInsert)
        nodeToInsert.previous = node.previous
        nodeToInsert.next = node
        
        if node.previous == nil {
            head = nodeToInsert
        } else {
            node.previous?.next = nodeToInsert
        }
        node.previous = nodeToInsert
    }

    func insertAfter(node: Node, nodeToInsert: Node) {
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        
        remove(node: nodeToInsert)
        nodeToInsert.previous = node
        nodeToInsert.next = node.next
        
        if node.next == nil {
            tail = nodeToInsert
        } else {
            node.next?.previous = nodeToInsert
        }
        
        node.next = nodeToInsert
    }

    func setHead(node: Node) {
        if head == nil {
            head = node
            tail = node
            return
        }
        
        insertBefore(node: head!, nodeToInsert: node)
    }

    func setTail(node: Node) {
        if tail == nil {
            setHead(node: node)
            return
        }
        insertAfter(node: tail!, nodeToInsert: node)
    }

    func insertAtPosition(position: Int, nodeToInsert: Node) {
        if position == 1 {
            setHead(node: nodeToInsert)
            return
        }
        
        var node = head
        var currentPosition = 1
        
        while node !== nil, currentPosition != position {
            node = node?.next
            currentPosition += 1
        }
        
        if node !== nil {
            insertBefore(node: node!, nodeToInsert: nodeToInsert)
        } else {
            setTail(node: nodeToInsert)
        }
    }
    
    func removeNodeBindings(node: Node) {
        if let previous = node.previous {
            previous.next = node.next
        }
        
        if let next = node.next {
            next.previous = node.previous
        }
        
        node.previous = nil
        node.next = nil
    }
    
    func printList() {
        var current: Node? = head
        while current != nil {
            print("Node: \(current!.value)")
            current = current!.next
        }
    }
}

var list = DoublyLinkedList()
var one = Node(value: 1)
var two = Node(value: 2)
var three = Node(value: 3)
var four = Node(value: 4)
var five = Node(value: 5)
var six = Node(value: 6)
list.insertAfter(node: one, nodeToInsert: one)
list.insertAfter(node: one, nodeToInsert: two)
list.insertBefore(node: two, nodeToInsert: three)
list.insertAfter(node: three, nodeToInsert: four)
list.insertAfter(node: four, nodeToInsert: six)
list.insertAfter(node: six, nodeToInsert: Node(value: 6))
list.insertAtPosition(position: 1, nodeToInsert: five)

list.printList()
print(list.containsNodeWithValue(value: 4))
print(list.containsNodeWithValue(value: 5))

list.remove(node: three)
list.removeNodesWithValue(value: 6)
list.printList()

