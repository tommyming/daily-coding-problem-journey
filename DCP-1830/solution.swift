// Problem 1830
// Find the word in a 2D grid
// Approach: DFS with backtracking

import Foundation

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        let word = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        func dfs(_ row: Int, _ col: Int, _ index: Int) -> Bool {
            if index == word.count { return true }
            
            if row < 0 || row >= rows || col < 0 || col >= cols || 
               visited[row][col] || board[row][col] != word[index] {
                return false
            }
            
            visited[row][col] = true
            
            let result = dfs(row + 1, col, index + 1) ||
                        dfs(row - 1, col, index + 1) ||
                        dfs(row, col + 1, index + 1) ||
                        dfs(row, col - 1, index + 1)
                        
            visited[row][col] = false
            return result
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if dfs(row, col, 0) {
                    return true
                }
            }
        }
        return false
    }
}