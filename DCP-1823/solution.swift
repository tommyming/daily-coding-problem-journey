// Problem 1823 (Remove sole child of binary tree)

import Foundation

class TreeNode<T> {
    var value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

func makeFullBinaryTree<T>(_ root: TreeNode<T>?) -> TreeNode<T>? {
    // Base cases
    guard let root = root else { return nil }
    if root.left == nil && root.right == nil {
        return root
    }
    
    // Recursively process subtrees
    root.left = makeFullBinaryTree(root.left)
    root.right = makeFullBinaryTree(root.right)
    
    // If node has only one child, return that child
    if root.left == nil {
        return root.right
    }
    if root.right == nil {
        return root.left
    }
    
    // Node has both children, keep it
    return root
}