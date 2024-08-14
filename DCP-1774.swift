// Problem 1774
// Smallest Reduction Steps to 1

import Foundation

func minSteps(to n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: max(n + 1, 2))

    dp[1] = 0
    if n > 1 { dp[2] = 1 }

    for i in 3...n {
        dp[i] = dp[i-1] + 1

        for j in 2...Int(sqrt(Double(i))) {
            if i % j == 0 {
                let larger = max(j, i/j) 
                dp[i] = min(dp[i], dp[larger] + 1)
            }
        }
    }

    return dp[n]
}

