// Problem 1755
// Binary Tree Building

import Foundation

class TreeNode {
    var val: Int?
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func countNodes(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }

    let leftDepth = getLeftDepth(root)
    let rightDepth = getRightDepth(root)

    if leftDepth == rightDepth {
        return (1 << leftDepth) - 1
    } else {
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}

private func getLeftDepth(_ node: TreeNode?) -> Int {
    var depth = 0
    var current = node
    while current != nil {
        depth += 1
        current = current?.left
    }

    return depth
}

private func getRightDepth(_ node: TreeNode?) -> Int {
    var depth = 0
    var current = node
    while current != nil {
        depth += 1
        current = current?.right
    }

    return depth
}