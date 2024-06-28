import Foundation

// Queue data structure, implemented with 2 Stacks
struct Queue<T> where T: Equatable {

    // Strcture Definition
    private var inStack: [T] = []
    private var outStack: [T] = []

    // Add the element to inStack
    mutating func enqueue(_ element: T) {
        inStack.append(element)
    }

    // If outStack is empty, reverse inStack and assign it to outStack
    // Then we clear in inStack
    // Finally, we pop the last element from outStack
    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }

    // Access the front element of the queue
    // If the outStack is empty, return the first element of inStack
    // else return the last element of outStack
    var front: T? {
        return outStack.last ?? inStack.first
    }

    // Check if the queues is empty
    var isEmpty: Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
}