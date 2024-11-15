class KnightTour {
    private val moves = arrayOf(
        Pair(2, 1), Pair(1, 2), Pair(-1, 2), Pair(-2, 1),
        Pair(-2, -1), Pair(-1, -2), Pair(1, -2), Pair(2, -1)
    )
    private var count = 0
    
    fun countTours(n: Int): Int {
        val board = Array(n) { IntArray(n) { -1 } }
        count = 0
        
        // Try starting from each position
        for (i in 0 until n) {
            for (j in 0 until n) {
                board[i][j] = 0
                findTours(board, i, j, 1, n)
                board[i][j] = -1
            }
        }
        return count
    }
    
    private fun isValid(row: Int, col: Int, n: Int): Boolean {
        return row >= 0 && row < n && col >= 0 && col < n
    }
    
    private fun findTours(board: Array<IntArray>, row: Int, col: Int, move: Int, n: Int) {
        if (move == n * n) {
            count++
            return
        }
        
        for ((dx, dy) in moves) {
            val newRow = row + dx
            val newCol = col + dy
            
            if (isValid(newRow, newCol, n) && board[newRow][newCol] == -1) {
                board[newRow][newCol] = move
                findTours(board, newRow, newCol, move + 1, n)
                board[newRow][newCol] = -1
            }
        }
    }
}