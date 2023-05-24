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
        if head == nil {
            return false
        }
        var current: Node? = head
        while current != nil {
            if current!.value == value {
                return true
            }
            current = current!.next
        }
        
        return false
    }

    func remove(node: Node) {
        if head == nil {
            return
        }
        
        if head!.value == node.value {
            head?.next = nil
            head?.previous = nil
            setTail(node: head!)
        }
        
        var current: Node? = head
        while current != nil, current!.value != node.value {
            current = current!.next
        }
        
        var prevNode: Node? = current!.previous
        var nextNode: Node? = current!.next
        
        if prevNode != nil, nextNode != nil {
            prevNode?.next = nextNode
            nextNode?.previous = prevNode
        }
        
        current?.next = nil
        current?.previous = nil
    }

    func removeNodesWithValue(value: Int) {
        var current: Node? = head
        
        while current != nil {
            print("Current: \(current!.value)")
            var buffer = current!
            current = current!.next
            if buffer.value == value {
                remove(node: buffer)
            }
        }
    }

    func insertBefore(node: Node, nodeToInsert: Node) {
        if head == nil {
            setHead(node: nodeToInsert)
            setTail(node: nodeToInsert)
            return
        }
        
        if node.value == head!.value {
            head!.previous = nodeToInsert
            nodeToInsert.next = head
            setHead(node: nodeToInsert)
            setTail(node: head!)
            return
        }
        
        var current: Node? = head
        
        while current != nil, current!.value != node.value {
            current = current!.next
        }
        
        var previous: Node? = current!.previous
        if previous == nil {
            head = nodeToInsert
        }
        else{
            current!.previous = nodeToInsert
            previous!.next = nodeToInsert
            nodeToInsert.previous = previous
            nodeToInsert.next = current
        }
    }

    func insertAfter(node: Node, nodeToInsert: Node) {
        if head == nil {
            setHead(node: nodeToInsert)
            setTail(node: nodeToInsert)
            return
        }
        
        if node.value == head!.value {
            head!.next = nodeToInsert
            nodeToInsert.previous = head
            setHead(node: head!)
            setTail(node: nodeToInsert)
            return
        }
        
        var current: Node? = head
        
        while current != nil, current!.value != node.value {
            current = current!.next
        }
        
        var nextNode: Node? = current?.next
        
        if nextNode == nil {
            tail = nodeToInsert
        } else {
            current!.next = nodeToInsert
            nextNode?.previous = nodeToInsert
            nodeToInsert.next = nextNode
            nodeToInsert.previous = current
        }
    }

    func setHead(node: Node) {
        head = node
    }

    func setTail(node: Node) {
        tail = node
    }

    func insertAtPosition(position: Int, nodeToInsert: Node) {
        if head == nil {
            setHead(node: nodeToInsert)
            setTail(node: nodeToInsert)
            return
        }
        
        var index = 0
        var current: Node? = head
        
        while current != nil, index <= position {
            if index == position {
                insertBefore(node: current!, nodeToInsert: nodeToInsert)
                return
            }
            current = current!.next
            index += 1
        }
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

