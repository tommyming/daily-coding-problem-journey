// Question 1742

class TreeNode {
    let value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

func generateTrees(_ n: Int) -> [TreeNode?] {
    guard n != 0 else { return [] }
    return generateTreesHelper(1, n)
}

func generateTreesHelper(_ start: Int, _ end: Int) -> [TreeNode?] {
    var result: [TreeNode?] = []
    if start > end {
        result.append(nil)
        return result
    }

    for i in start...end {
        let leftTrees = generateTreesHelper(start, i - 1)
        let rightTrees = generateTreesHelper(i + 1, end)

        for left in leftTrees {
            for right in rightTrees {
                let root = TreeNode(i)
                root.left = left
                root.right = right
                result.append(root)
            }
        }
    }

    return result
}
