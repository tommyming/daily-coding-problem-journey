fun eggDrop(n: Int, k: Int): Int {
    // Create a table to store results of subproblems
    val dp = Array(n + 1) { IntArray(k + 1) }

    // If we have one egg, we need to do k trials for k floors
    for (i in 1..k) {
        dp[1][i] = i
    }

    // If we have zero floors, we need zero trials
    for (i in 1..n) {
        dp[i][0] = 0
    }

    // Fill the rest of the table
    for (eggs in 2..n) {
        for (floors in 1..k) {
            dp[eggs][floors] = Int.MAX_VALUE
            for (x in 1..floors) {
                val res = Math.max(dp[eggs - 1][x - 1], dp[eggs][floors - x])
                dp[eggs][floors] = Math.min(dp[eggs][floors], res + 1)
            }
        }
    }

    return dp[n][k]
}

// Example usage:
val result = eggDrop(2, 100)
println("Minimum number of trials in worst case with 2 eggs and 100 floors is $result")