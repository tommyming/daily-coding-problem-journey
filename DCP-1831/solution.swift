// Problem 1831 (minimum integer not in subset)

import Foundation

func findSmallestMissingSum(_ arr: [Int]) -> Int {
    var result = 1
    
    for num in arr {
        if num > result {
            return result
        }
        result += num
    }
    
    return result
}