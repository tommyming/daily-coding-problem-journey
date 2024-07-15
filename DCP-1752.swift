// Problem 1752
// Remove kth element from the end of the linked list

import Foundation

class Node {
    var value: Int
    var next: Self?
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}

func removeKthFromEnd(_ head: Node?, k: Int) -> Node? {
    let dummy = Node(0)
    dummy.next = head
    var fast: Node? = dummy
    var slow: Node? = dummy

    // The key is in here, creating the gap between the fast and slow pointer.
    for _ in 0..<k {
        fast = fast?.next
    }

    // Then, we iterate through the the list.
    // Suppose fast will reach the end early than the slow, as it is k steps faster.
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    // Last, we remove the exact element(the next element of "slow").
    slow?.next = slow?.next?.next

    return dummy.next
}

// There are a few key concepts you should know, for this typs of question:
// Two-pointer Technique: This method uses 2 pointers that trasverse that list different speeds or with a specific offset.
// Single Pass: That means the list can only trasverse once.
// Constant Space: Space amount used is fixed.

