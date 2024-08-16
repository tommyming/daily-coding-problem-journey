// Problem 1776
// Keypad unlock partterns

import Foundation

class Solution {
    private let directions = [
        [-1, 0], [1, 0], [0, -1], [0, 1],
        [-1, -1], [1, 1], [-1, 1], [1, -1]
    ]
    
    func numberOfPatterns(_ n: Int) -> Int {
        var used = Array(repeating: false, count: 9)
        var count = 0
        
        for length in n...9 {
            for i in 0..<9 {
                count += dfs(i, length - 1, &used)
            }
        }
        
        return count
    }
    
    private func dfs(_ current: Int, _ remaining: Int, _ used: inout [Bool]) -> Int {
        if remaining == 0 {
            return 1
        }
        
        used[current] = true
        var count = 0
        
        for next in 0..<9 {
            if !used[next] && isValid(current, next, &used) {
                count += dfs(next, remaining - 1, &used)
            }
        }
        
        used[current] = false
        return count
    }
    
    private func isValid(_ start: Int, _ end: Int, _ used: inout [Bool]) -> Bool {
        let x1 = start / 3, y1 = start % 3
        let x2 = end / 3, y2 = end % 3
        
        if (x1 + x2) % 2 == 1 || (y1 + y2) % 2 == 1 {
            return true
        }
        
        let midX = (x1 + x2) / 2
        let midY = (y1 + y2) / 2
        
        return used[midX * 3 + midY]
    }
}