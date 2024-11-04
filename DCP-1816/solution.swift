// DCP-1816
// Implement custom map with timeframe function

import Foundation

class TimeMap<K: Hashable, V> {
    private var storage: [K: [(timestamp: Int, value: V)]] = [:]
    
    // O(1) operation, since we are just appending the value to the storage.
    func set(key: K, value: V, timestamp: Int) {
        if storage[key] == nil {
            storage[key] = []
        }
        storage[key]?.append((timestamp: timestamp, value: value))
    }
    // O(log n) operation, since we are using binary search to find the value.
    func get(key: K, timestamp: Int) -> V? {
        guard let values = storage[key] else { return nil }
        
        var left = 0
        var right = values.count - 1
        var result: V? = nil
        
        while left <= right {
            let mid = (left + right) / 2
            let currentTimestamp = values[mid].timestamp
            
            if currentTimestamp <= timestamp {
                result = values[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}