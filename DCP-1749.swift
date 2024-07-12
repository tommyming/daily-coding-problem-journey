// Problem 1749
// Yet another Buy-Sell-Stock Problem

import Foundation

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    let n = prices.count
    if n == 0 || k == 0 { return 0 }

    if k >= n / 2 {
        var maxProfit = 0
        for i in 1..<n {
            if prices[i] > prices[i - 1] {
                maxProfit += prices[i] - prices[i - 1]
            }
        }
        return maxProfit
    }

    var dp = Array(repeating: Array(repeating: 0, count: n), count: k + 1)

    for i in 1...k {
        var maxDiff = -prices[0]
        for j in 1..<n {
            dp[i][j] = max(dp[i][j - 1], prices[j] + maxDiff)
            maxDiff = max(maxDiff, dp[i - 1][j] - prices[j])
        }
    }

    return dp[k][n - 1]
}