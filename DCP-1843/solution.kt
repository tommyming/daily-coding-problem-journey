fun findMaximum(x: Int, y: Int): Int {
    return (kotlin.math.abs(x - y) + (x + y)) / 2
}

// Example usage
val a = 86
val b = 34
val maximum = findMaximum(a, b)
