// Problem 1821
// Finding Square root of number

import Foundation

// Using built-in function - O(1) time complexity
func findSquareRootBuiltIn(_ n: Double) -> Double {
    guard n >= 0 else { return .nan }
    return n.squareRoot()
}

// Using Newton's method - O(log n) time complexity
func findSquareRootNewton(_ n: Double) -> Double {
    guard n >= 0 else { return .nan }
    if n == 0 { return 0 }
    
    var x = n / 2
    let epsilon = 0.00001
    
    while true {
        let root = x - (x * x - n) / (2 * x)
        if abs(root - x) < epsilon {
            return root
        }
        x = root
    }
}