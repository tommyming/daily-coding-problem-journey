// Problem 1827
// Minimum Trials on dropping the eggs

import Foundation

func eggDrop(_ n: Int, _ k: Int) -> Int {
    // Create a table to store results of subproblems
    var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

    // If we have one egg, we need to do k trials for k floors
    for i in 1...k {
        dp[1][i] = i
    }

    // If we have zero floors, we need zero trials
    for i in 1...n {
        dp[i][0] = 0
    }

    // Fill the rest of the table
    for eggs in 2...n {
        for floors in 1...k {
            dp[eggs][floors] = Int.max
            for x in 1...floors {
                let res = max(dp[eggs - 1][x - 1], dp[eggs][floors - x])
                dp[eggs][floors] = min(dp[eggs][floors], res + 1)
            }
        }
    }
    
    return dp[n][k]
}

// Example usage:
let result = eggDrop(2, 100)
print("Minimum number of trials in worst case with 2 eggs and 100 floors is \(result)")