// Problem 1822 (bipartite graph)

import Foundation

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        var colors = Array(repeating: -1, count: n)
        
        // DFS function to color vertices
        func dfs(_ node: Int, _ color: Int) -> Bool {
            colors[node] = color
            
            for neighbor in graph[node] {
                if colors[neighbor] == -1 {
                    // Color neighbor with opposite color
                    if !dfs(neighbor, 1 - color) {
                        return false
                    }
                } else if colors[neighbor] == color {
                    // If neighbor has same color, graph is not bipartite
                    return false
                }
            }
            return true
        }
        
        // Check each component of the graph
        for node in 0..<n where colors[node] == -1 {
            if !dfs(node, 0) {
                return false
            }
        }
        
        return true
    }
}