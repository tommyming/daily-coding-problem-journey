// Problem 1828
// Chances of earning money in a stock

import Foundation

func hasArbitrage(exchangeRates: [[Double]]) -> Bool {
    let n = exchangeRates.count
    var distances = [Double](repeating: Double.greatestFiniteMagnitude, count: n)
    distances[0] = 0.0  // Start from the first currency

    for _ in 0..<n-1 {
        for u in 0..<n {
            for v in 0..<n {
                if exchangeRates[u][v] > 0 { // Only consider valid exchanges
                    let weight = -log(exchangeRates[u][v])
                    if distances[u] != Double.greatestFiniteMagnitude && distances[u] + weight < distances[v] {
                        distances[v] = distances[u] + weight
                    }
                }
            }
        }
    }

    // Check for negative weight cycles
    for u in 0..<n {
        for v in 0..<n {
            if exchangeRates[u][v] > 0 {
                let weight = -log(exchangeRates[u][v])
                if distances[u] != Double.greatestFiniteMagnitude && distances[u] + weight < distances[v] {
                    return true // Arbitrage opportunity found
                }
            }
        }
    }

    return false // No arbitrage opportunity
}

// Example usage
let rates = [
    [1.0, 0.741, 0.995],
    [1.352, 1.0, 1.366],
    [1.005, 0.732, 1.0]
]

print(hasArbitrage(exchangeRates: rates)) // Output: true or false