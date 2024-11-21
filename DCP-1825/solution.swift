// Problem 1825
// Circular Queue

import Foundation

class Graph {
    private let vertices: Int
    private var adj: [[Int]]
    private var inDegree: [Int]
    
    init(_ v: Int) {
        vertices = v
        adj = Array(repeating: [], count: v)
        inDegree = Array(repeating: 0, count: v)
    }
    
    func addEdge(_ v: Int, _ w: Int) {
        adj[v].append(w)
        inDegree[w] += 1
    }
    
    private func isStronglyConnected() -> Bool {
        var visited = Array(repeating: false, count: vertices)
        
        // Find a vertex with non-zero degree
        var startVertex = 0
        for i in 0..<vertices {
            if !adj[i].isEmpty {
                startVertex = i
                break
            }
        }
        
        // DFS starting from startVertex
        dfs(startVertex, &visited)
        
        // Check if all non-zero degree vertices are visited
        for i in 0..<vertices {
            if !adj[i].isEmpty && !visited[i] {
                return false
            }
        }
        
        return true
    }
    
    private func dfs(_ v: Int, _ visited: inout [Bool]) {
        visited[v] = true
        for u in adj[v] {
            if !visited[u] {
                dfs(u, &visited)
            }
        }
    }
    
    func hasEulerianCycle() -> Bool {
        if !isStronglyConnected() {
            return false
        }
        
        // Check if in degree equals out degree for every vertex
        for i in 0..<vertices {
            if adj[i].count != inDegree[i] {
                return false
            }
        }
        
        return true
    }
}

func canChainWords(_ words: [String]) -> Bool {
    let graph = Graph(26) // 26 letters
    
    // Create edges between first and last characters
    for word in words {
        let first = Int(word.first!.asciiValue! - Character("a").asciiValue!)
        let last = Int(word.last!.asciiValue! - Character("a").asciiValue!)
        graph.addEdge(first, last)
    }
    
    return graph.hasEulerianCycle()
}