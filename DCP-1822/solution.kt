// Problem 1822 (bipartite graph)

class Solution {
    fun isBipartite(graph: Array<IntArray>): Boolean {
        val n = graph.size
        val colors = IntArray(n) { -1 }
        
        fun dfs(node: Int, color: Int): Boolean {
            colors[node] = color
            
            for (neighbor in graph[node]) {
                if (colors[neighbor] == -1) {
                    if (!dfs(neighbor, 1 - color)) {
                        return false
                    }
                } else if (colors[neighbor] == color) {
                    return false
                }
            }
            return true
        }
        
        for (node in 0 until n) {
            if (colors[node] == -1 && !dfs(node, 0)) {
                return false
            }
        }
        
        return true
    }
}