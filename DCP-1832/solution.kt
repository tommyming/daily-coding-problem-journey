// Problem 1832

fun expectedRounds(n: Int): Int {
    if (n == 1) {
        return 0
    }
    return 1 + expectedRounds(n / 2)
}