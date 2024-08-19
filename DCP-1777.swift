// Problem 1777
// Bishop Attacks

import Foundation

struct Bishop: Hashable {
    let row: Int
    let column: Int
}

func countAttackingBishopPairs(_ bishops: [(Int, Int)], boardSize: Int) -> Int {
    let bishopSet = Set(bishops.map { Bishop(row: $0.0, column: $0.1) })

    var attackingPairs = 0

    func isValidPosition(_ row: Int, _ column: Int) -> Bool {
        return row >= 0 && row < boardSize && column >= 0 && column < boardSize
    }

    for bishop in bishopSet {
        // Check top-right diagonal
        var r = bishop.row - 1
        var c = bishop.column + 1
        while isValidPosition(r, c) {
            if bishopSet.contains(Bishop(row: r, column: c)) {
                attackingPairs += 1
            }
            r -= 1
            c += 1
        }
        
        // Check top-left diagonal
        r = bishop.row - 1
        c = bishop.column - 1
        while isValidPosition(r, c) {
            if bishopSet.contains(Bishop(row: r, column: c)) {
                attackingPairs += 1
            }
            r -= 1
            c -= 1
        }
    }

    return attackingPairs
}