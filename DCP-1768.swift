// Problem 1768
// Navigation Direction Check

import Foundation

enum Direction {
    case N, NE, E, SE, S, SW, W, NW
}

struct Rule {
    let from: String
    let to: String
    let direction: Direction
}

/// Checks if the given set of rules is consistent
/// - Parameter rules: An array of Rule objects
/// - Returns: A boolean indicating whether the rules are consistent
func isConsistent(_ rules: [Rule]) -> Bool {
    var graph: [String: [Direction]] = [:]

    // Build a graph representation of the rules
    for rule in rules {
        if graph[rule.from] == nil { graph[rule.from] = [:] } 
        if graph[rule.to] == nil { graph[rule.to] = [:] }

        graph[rule.from]!.insert(rule.direction)
        graph[rule.to]!.insert(rule.direction)
    }

    // Check consistency for each point in the graph
    for (point, directions) in graph {
        if !isConsistentForPoint(point, directions, graph) { return false }
    }

    return true
}

/// Returns the opposite direction for a given direction
/// - Parameter direction: The input Direction
/// - Returns: The opposite Direction
func oppositeDirection(_ direction: Direction) -> Direction {
    switch direction {
    case .N: return .S
    case .NE: return .SW
    case .E: return .W
    case .SE: return .NW
    case .S: return .N
    case .SW: return .NE
    case .W: return .E
    case .NW: return .SE
    }
}

/// Checks if the directions for a specific point are consistent
/// - Parameters:
///   - point: The point to check
///   - connections: The directions connected to this point
///   - graph: The entire graph of connections
/// - Returns: A boolean indicating whether the directions are consistent for this point
func isConsistentForPoint(_ point: String, _ connections: [String: Direction], _ graph: [String: [String: Direction]]) -> Bool {
    for (p1, d1) in connections {
        for (p2, d2) in connections {
            if p1 != p2 {
                if !areDirectionsConsistent(d1, d2, graph[p1]?[p2]) {
                    return false
                }
            }
        }
    }
    return true
}

/// Checks if three directions are consistent
/// - Parameters:
///   - d1: First direction
///   - d2: Second direction
///   - d3: Third direction (optional)
/// - Returns: A boolean indicating whether the directions are consistent
func areDirectionsConsistent(_ d1: Direction, _ d2: Direction, _ d3: Direction?) -> Bool {
    if let d3 = d3 {
        return isConsistentTriple(d1, d2, d3)
    }
    return true
}

/// Checks if three directions form a consistent triple
/// - Parameters:
///   - d1: First direction
///   - d2: Second direction
///   - d3: Third direction
/// - Returns: A boolean indicating whether the three directions are consistent
func isConsistentTriple(_ d1: Direction, _ d2: Direction, _ d3: Direction) -> Bool {
    let clockwise = Direction.allCases
    let index1 = clockwise.firstIndex(of: d1)!
    let index2 = clockwise.firstIndex(of: d2)!
    let index3 = clockwise.firstIndex(of: d3)!
    
    let diff1 = (index2 - index1 + 8) % 8
    let diff2 = (index3 - index2 + 8) % 8
    let diff3 = (index1 - index3 + 8) % 8
    
    return diff1 + diff2 + diff3 == 8
}