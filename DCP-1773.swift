// Problem 1773
// Counting Pairs

import Foundation

func countPairs(_ M: Int, _ N: Int) -> Int {
    var count = 0

    for a in 1..<M {
        let b = M - a
        if a > 0 && b > 0 && (a * b) == N {
            count += 1
        }
    }

    return count
}