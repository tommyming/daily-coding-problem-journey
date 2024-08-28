// Problem 1782
// Square Number Sum

import Foundation

func minSquares(_ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: n + 1)
    dp[0] = 0

    for i in 1...n {
        for j in 1...Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], dp[i - j * j] + 1)
        }
    }

    return dp[n]
}