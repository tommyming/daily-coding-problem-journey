data class Edge(val to: Int, val time: Int)

fun calculateMessageTime(n: Int, edges: List<Triple<Int, Int, Int>>): IntArray {
    // Create adjacency list
    val graph = Array(n) { mutableListOf<Edge>() }
    
    edges.forEach { (from, to, time) ->
        graph[from].add(Edge(to, time))
        graph[to].add(Edge(from, time))
    }
    
    // Initialize distances array
    val times = IntArray(n) { Int.MAX_VALUE }
    times[0] = 0
    
    // Priority queue to store (time, node)
    val pq = PriorityQueue<Pair<Int, Int>>(compareBy { it.first })
    pq.offer(0 to 0)
    
    while (pq.isNotEmpty()) {
        val (currentTime, current) = pq.poll()
        
        if (currentTime > times[current]) {
            continue
        }
        
        for (edge in graph[current]) {
            val newTime = currentTime + edge.time
            if (newTime < times[edge.to]) {
                times[edge.to] = newTime
                pq.offer(newTime to edge.to)
            }
        }
    }
    
    return times
}