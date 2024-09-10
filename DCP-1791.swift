// Problem
// Custom Data Structure
// Restricted that all operations should be O(1).

import Foundation

class FrequencyNode {
    var key: String
    var count: Int
    var prev: FrequencyNode?
    var next: FrequencyNode?
    
    init(key: String, count: Int) {
        self.key = key
        self.count = count
    }
}

class AllO1DataStructure {
    private var dict: [String: FrequencyNode] = [:]
    private var head: FrequencyNode?
    private var tail: FrequencyNode?
    
    func plus(_ key: String) {
        if let node = dict[key] {
            incrementCount(node)
        } else {
            let newNode = FrequencyNode(key: key, count: 1)
            dict[key] = newNode
            insertAtHead(newNode)
        }
    }
    
    func minus(_ key: String) {
        guard let node = dict[key] else { return }
        
        if node.count == 1 {
            dict.removeValue(forKey: key)
            removeNode(node)
        } else {
            decrementCount(node)
        }
    }
    
    func getMax() -> String? {
        return tail?.key
    }
    
    func getMin() -> String? {
        return head?.key
    }
    
    private func incrementCount(_ node: FrequencyNode) {
        node.count += 1
        moveNodeRight(node)
    }
    
    private func decrementCount(_ node: FrequencyNode) {
        node.count -= 1
        moveNodeLeft(node)
    }
    
    private func insertAtHead(_ node: FrequencyNode) {
        if head == nil {
            head = node
            tail = node
        } else {
            node.next = head
            head?.prev = node
            head = node
        }
    }
    
    private func removeNode(_ node: FrequencyNode) {
        if node === head { head = node.next }
        if node === tail { tail = node.prev }
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    private func moveNodeRight(_ node: FrequencyNode) {
        while node.next != nil && node.count > node.next!.count {
            let nextNode = node.next!
            swapNodes(node, nextNode)
        }
        if node.next == nil { tail = node }
    }
    
    private func moveNodeLeft(_ node: FrequencyNode) {
        while node.prev != nil && node.count < node.prev!.count {
            let prevNode = node.prev!
            swapNodes(prevNode, node)
        }
        if node.prev == nil { head = node }
    }
    
    private func swapNodes(_ node1: FrequencyNode, _ node2: FrequencyNode) {
        let tempKey = node1.key
        node1.key = node2.key
        node2.key = tempKey
        
        let tempCount = node1.count
        node1.count = node2.count
        node2.count = tempCount
        
        dict[node1.key] = node1
        dict[node2.key] = node2
    }
}