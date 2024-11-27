// Problem 1832 (Minimum rounds of flipping coins.)
func expectedRounds(_ n: Int) -> Int {
    if n == 1 {
        return 0
    }
    return 1 + expectedRounds(n / 2)
}