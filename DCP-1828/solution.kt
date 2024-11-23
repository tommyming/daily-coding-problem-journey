// Problem 1828

import kotlin.math.ln

fun hasArbitrage(exchangeRates: Array<DoubleArray>): Boolean {
    val n = exchangeRates.size
    val distances = DoubleArray(n) { Double.MAX_VALUE }
    distances[0] = 0.0 // Start from the first currency

    for (i in 1 until n) {
        for (u in 0 until n) {
            for (v in 0 until n) {
                if (exchangeRates[u][v] > 0) { // Only consider valid exchanges
                    val weight = -ln(exchangeRates[u][v])
                    if (distances[u] != Double.MAX_VALUE && distances[u] + weight < distances[v]) {
                        distances[v] = distances[u] + weight
                    }
                }
            }
        }
    }

    // Check for negative weight cycles
    for (u in 0 until n) {
        for (v in 0 until n) {
            if (exchangeRates[u][v] > 0) {
                val weight = -ln(exchangeRates[u][v])
                if (distances[u] != Double.MAX_VALUE && distances[u] + weight < distances[v]) {
                    return true // Arbitrage opportunity found
                }
            }
        }
    }

    return false // No arbitrage opportunity
}

// Example usage
fun main() {
    val rates = arrayOf(
        doubleArrayOf(1.0, 0.741, 0.995),
        doubleArrayOf(1.352, 1.0, 1.366),
        doubleArrayOf(1.005, 0.732, 1.0)
    )

    println(hasArbitrage(rates)) // Output: true or false
}