// Problem 1761
// Stack Interleaving using Queue

import Foundation

// But first, since there are no stack and queue implementations in the standard library, we need to implement them.

class Stack {
    var elements: [Int] = []

    func push(_ element: Int) {
        elements.append(element)
    }

    func pop() -> Int? {
        return elements.popLast()
    }

    var isempty: Bool { return elements.isEmpty }
}

class Queue {
    var elements: [Int] = []

    func enqueue(_ element: Int) {
        elements.append(element)
    }

    func dequeue() -> Int? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    var isEmpty: Bool { return elements.isEmpty }
}

func interleaveStack(_ stack: Stack) -> Stack {
    let queue = Queue()
    var tempStack = Stack()
    var count = 0

    // Move element from stack to queue
    while !stack.isempty {
        queue.enqueue(stack.pop()!)
        count += 1
    }

    // Move elements back to stack
    while !queue.isEmpty {
        stack.push(queue.dequeue()!)
    }

    // Move half of the elements from stack to tempStack
    for _ in 1...count/2 {
        tempStack.push(stack.pop()!)
    }

    // Move elements from tempStack to queue
    while !tempStack.isempty {
        queue.enqueue(tempStack.pop()!)
    }

    // Interleave elements from stack and queue
    while !queue.isEmpty {
        stack.push(queue.dequeue()!)
        if !tempStack.isempty {
            tempStack.push(stack.pop()!)
        }
    }

    // Move elements from tempStack back to stack
    while !tempStack.isempty {
        stack.push(tempStack.pop()!)
    }

    return stack

}