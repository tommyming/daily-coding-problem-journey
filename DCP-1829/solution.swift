// Problem 1829
// Strategy Move of always winning in a ghost game

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

func optimalStartingLetters(dictionary: [String]) -> [Character] {
    let root = TrieNode()
    
    // Build Trie
    for word in dictionary {
        var node = root
        for letter in word {
            if node.children[letter] == nil {
                node.children[letter] = TrieNode()
            }
            node = node.children[letter]!
        }
        node.isEndOfWord = true
    }
    
    func canWin(node: TrieNode, isPlayer1Turn: Bool) -> Bool {
        if node.isEndOfWord {
            return !isPlayer1Turn
        }
        
        for (_, childNode) in node.children {
            if !canWin(node: childNode, isPlayer1Turn: !isPlayer1Turn) {
                return true
            }
        }
        
        return false
    }
    
    var optimalStarts: [Character] = []
    
    for (letter, node) in root.children {
        if canWin(node: node, isPlayer1Turn: false) {
            optimalStarts.append(letter)
        }
    }
    
    return optimalStarts
}

// Example usage
let dictionary = ["cat", "calf", "dog", "bear"]
let result = optimalStartingLetters(dictionary: dictionary)
print(result) // Output: ["b", "c", "d"]
