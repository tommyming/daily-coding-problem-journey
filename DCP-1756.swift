// Problem 1756
// Hit Counter

import Foundation

class HitCounter {
    private var hits: [(timestamp: Int, count: Int)] = []

    func record(timestamp: Int) {
        if let lastHit = hits.last, lastHit.timestamp == timestamp {
            hits[hits.count - 1].count += 1
        } else {
            hits.append((timestamp: timestamp, count: 1))
        }
    }

    func total() -> Int {
        hits.reduce(0) { $0 + $1.count }
    }

    func range(_ lower: Int, upper: Int) -> Int {
        hits.filter { $0.timestamp >= lower && $0.timestamp <= upper }
            .reduce(0) { $0 + $1.count }
    }
}

// IF, the system has limited memory
// Implement Circular Buffer
// Aggregate data
// Use more efficient data structures
// Compress old data
// External storage