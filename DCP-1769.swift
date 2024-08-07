// Problem 1769
// Shortest Up-Downhill Path

import Foundation

struct Edge: Hashable {
    let to: Int
    let distance: Int
}

func shortestUPhillDownHillPath(elevations: [Int:Int], paths: [((Int, Int), Int)]) -> Int {
    var graph = [Int: [Edge]]()

    for ((from,to), distance) in paths {
        graph[from, default: []].append(Edge(to: to, distance: distance))
        graph[to, default: []].append(Edge(to: from, distance: distance))
    }

    func dijkstra(start: Int, isUphill: Bool) -> [Int: Int] {
        var distances: [Int: Int] = [start: 0]
        var pq = [(distances: 0, node: start)]

        while !pq.isEmpty {
            let (distances, node) = pq.removeMin()

            for edge in graph[node, default: []] {
                if (isUphill && elevations[edge.to]! > elevations[node]!) ||
                   (!isUphill && elevations[edge.to]! < elevations[node]!) {
                    let newDistance = distance + edge.distance
                    if newDistance < distances[edge.to, default: Int.max] {
                        distances[edge.to] = newDistance
                        pq.append((distance: newDistance, node: edge.to))
                    }
                }
            }

            pq.sort { $0.distance < $1.distance }
        }

        return distances
    }

    let uphillDistances = dijkstra(start: 0, isUphill: true)
    var shortestPath = Int.max

    for (peak, uphillDistance) in uphillDistances {
        if peak != 0 {
            let downhillDistances = dijkstra(start: peak, isUphill: false)
            if let downhillDistance = downhillDistances[0] {
                shortestPath = min(shortestPath, uphillDistance + downhillDistance)
            }
        }
    }
    
    return shortestPath != Int.max ? shortestPath : -1 // Return -1 if no valid path found
}