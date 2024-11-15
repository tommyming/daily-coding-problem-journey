class TreeNode<T>(
    var value: T,
    var left: TreeNode<T>? = null,
    var right: TreeNode<T>? = null
)

fun <T> makeFullBinaryTree(root: TreeNode<T>?): TreeNode<T>? {
    // Base cases
    if (root == null) return null
    if (root.left == null && root.right == null) {
        return root
    }
    
    // Recursively process subtrees
    root.left = makeFullBinaryTree(root.left)
    root.right = makeFullBinaryTree(root.right)
    
    // If node has only one child, return that child
    if (root.left == null) {
        return root.right
    }
    if (root.right == null) {
        return root.left
    }
    
    // Node has both children, keep it
    return root
}