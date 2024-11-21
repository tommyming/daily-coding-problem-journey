// Problem 1825

class Graph(private val vertices: Int) {
    private val adj = Array(vertices) { mutableListOf<Int>() }
    private val inDegree = IntArray(vertices)
    
    fun addEdge(v: Int, w: Int) {
        adj[v].add(w)
        inDegree[w]++
    }
    
    private fun dfs(v: Int, visited: BooleanArray) {
        visited[v] = true
        for (u in adj[v]) {
            if (!visited[u]) {
                dfs(u, visited)
            }
        }
    }
    
    private fun isStronglyConnected(): Boolean {
        val visited = BooleanArray(vertices)
        
        // Find a vertex with non-zero degree
        val startVertex = (0 until vertices).find { adj[it].isNotEmpty() } ?: return true
        
        // DFS starting from startVertex
        dfs(startVertex, visited)
        
        // Check if all non-zero degree vertices are visited
        return (0 until vertices).none { adj[it].isNotEmpty() && !visited[it] }
    }
    
    fun hasEulerianCycle(): Boolean {
        if (!isStronglyConnected()) return false
        
        // Check if in degree equals out degree for every vertex
        return (0 until vertices).all { adj[it].size == inDegree[it] }
    }
}

fun canChainWords(words: List<String>): Boolean {
    val graph = Graph(26) // 26 letters
    
    // Create edges between first and last characters
    words.forEach { word ->
        val first = word.first() - 'a'
        val last = word.last() - 'a'
        graph.addEdge(first, last)
    }
    
    return graph.hasEulerianCycle()
}