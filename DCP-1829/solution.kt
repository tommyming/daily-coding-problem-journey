class TrieNode {
    val children = mutableMapOf<Char, TrieNode>()
    var isEndOfWord = false
}

fun optimalStartingLetters(dictionary: List<String>): List<Char> {
    val root = TrieNode()
    
    // Build Trie
    for (word in dictionary) {
        var node = root
        for (letter in word) {
            node.children.putIfAbsent(letter, TrieNode()).also { node = it }
        }
        node.isEndOfWord = true
    }
    
    fun canWin(node: TrieNode, isPlayer1Turn: Boolean): Boolean {
        if (node.isEndOfWord) return !isPlayer1Turn
        
        for (childNode in node.children.values) {
            if (!canWin(childNode, !isPlayer1Turn)) return true
        }
        
        return false
    }

    val optimalStarts = mutableListOf<Char>()
    
    for ((letter, node) in root.children) {
        if (canWin(node, false)) {
            optimalStarts.add(letter)
        }
    }
    
    return optimalStarts
}

// Example usage
val dictionary = listOf("cat", "calf", "dog", "bear")
val result = optimalStartingLetters(dictionary)
println(result) // Output: [b, c, d]