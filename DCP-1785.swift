// Problem 1785
// Construct Itinerary

import Foundation

class Solution {
    typealias Flight = (String, String)
    
    func findItinerary(_ flights: [Flight], _ start: String) -> [String]? {
        var graph = [String: [String]]()
        var itinerary = [start]
        
        // Build the graph
        for (origin, destination) in flights {
            graph[origin, default: []].append(destination)
        }
        
        // Sort destinations for lexicographical order
        for (origin, _) in graph {
            graph[origin]?.sort()
        }
        
        // DFS function
        func dfs(_ airport: String) -> Bool {
            if itinerary.count == flights.count + 1 {
                return true
            }
            
            guard var destinations = graph[airport], !destinations.isEmpty else {
                return false
            }
            
            for i in 0..<destinations.count {
                let nextAirport = destinations.removeFirst()
                itinerary.append(nextAirport)
                
                if dfs(nextAirport) {
                    return true
                }
                
                // Backtrack
                itinerary.removeLast()
                destinations.append(nextAirport)
                destinations.sort()
            }
            
            graph[airport] = destinations
            return false
        }
        
        // Start DFS from the starting airport
        return dfs(start) ? itinerary : nil
    }
}