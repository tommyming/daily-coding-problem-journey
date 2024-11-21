// Problem 1826

import Foundation

struct Edge {
    let to: Int
    let time: Int
}

func calculateMessageTime(n: Int, edges: [(Int, Int, Int)]) -> [Int] {
    // Create adjacency list
    var graph = [Int: [Edge]]()
    for i in 0..<n {
        graph[i] = []
    }
    
    for edge in edges {
        graph[edge.0]?.append(Edge(to: edge.1, time: edge.2))
        graph[edge.1]?.append(Edge(to: edge.0, time: edge.2))
    }
    
    // Initialize distances array
    var times = Array(repeating: Int.max, count: n)
    times[0] = 0
    
    // Priority queue to store (time, node)
    var pq = [(Int, Int)]()
    pq.append((0, 0))
    
    while !pq.isEmpty {
        pq.sort { $0.0 > $1.0 }
        let (currentTime, current) = pq.removeLast()
        
        if currentTime > times[current] {
            continue
        }
        
        for edge in graph[current] ?? [] {
            let newTime = currentTime + edge.time
            if newTime < times[edge.to] {
                times[edge.to] = newTime
                pq.append((newTime, edge.to))
            }
        }
    }
    
    return times
}