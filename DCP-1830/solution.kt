class Solution {
    fun exist(board: Array<CharArray>, word: String): Boolean {
        val rows = board.size
        val cols = board[0].size
        val visited = Array(rows) { BooleanArray(cols) }
        
        fun dfs(row: Int, col: Int, index: Int): Boolean {
            if (index == word.length) return true
            
            if (row < 0 || row >= rows || col < 0 || col >= cols ||
                visited[row][col] || board[row][col] != word[index]) {
                return false
            }
            
            visited[row][col] = true
            
            val result = dfs(row + 1, col, index + 1) ||
                        dfs(row - 1, col, index + 1) ||
                        dfs(row, col + 1, index + 1) ||
                        dfs(row, col - 1, index + 1)
                        
            visited[row][col] = false
            return result
        }
        
        for (row in 0 until rows) {
            for (col in 0 until cols) {
                if (dfs(row, col, 0)) return true
            }
        }
        return false
    }
}