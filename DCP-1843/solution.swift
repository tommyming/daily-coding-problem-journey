// Problem 1843 

import Foundation

func findMaximum(_ x: Int, _ y: Int) -> Int {
    return (abs(x - y) + (x + y)) / 2
}

// Example usage
let a = 86
let b = 34
let maximum = findMaximum(a, b)
