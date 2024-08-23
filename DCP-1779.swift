// Problem 1779
// Minimum number of coins

import Foundation

func minCoins(_ n: Int) -> Int {
    // Here will use standard american denominations.
    let denominations = [25, 10, 5, 1]
    var count = 0
    var remaining = n

    for coin in denominations {
        count += remaining / coin
        remaining = remaining % coin
    }

    return count
}