// Problem 1824 (Knight's tour)

import Foundation

class KnightTour {
    let moves = [(2, 1), (1, 2), (-1, 2), (-2, 1), 
                 (-2, -1), (-1, -2), (1, -2), (2, -1)]
    var count = 0
    
    func countTours(n: Int) -> Int {
        var board = Array(repeating: Array(repeating: -1, count: n), count: n)
        count = 0
        // Try starting from each position
        for i in 0..<n {
            for j in 0..<n {
                board[i][j] = 0
                findTours(board: &board, row: i, col: j, move: 1, n: n)
                board[i][j] = -1
            }
        }
        return count
    }
    
    private func isValid(_ row: Int, _ col: Int, _ n: Int) -> Bool {
        return row >= 0 && row < n && col >= 0 && col < n
    }
    
    private func findTours(board: inout [[Int]], row: Int, col: Int, move: Int, n: Int) {
        if move == n * n {
            count += 1
            return
        }
        
        for (dx, dy) in moves {
            let newRow = row + dx
            let newCol = col + dy
            
            if isValid(newRow, newCol, n) && board[newRow][newCol] == -1 {
                board[newRow][newCol] = move
                findTours(board: &board, row: newRow, col: newCol, move: move + 1, n: n)
                board[newRow][newCol] = -1
            }
        }
    }
}