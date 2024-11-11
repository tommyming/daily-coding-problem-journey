// Using built-in function - O(1) time complexity
fun findSquareRootBuiltIn(n: Double): Double {
    if (n < 0) return Double.NaN
    return kotlin.math.sqrt(n)
}

// Using Newton's method - O(log n) time complexity
fun findSquareRootNewton(n: Double): Double {
    if (n < 0) return Double.NaN
    if (n == 0.0) return 0.0
    
    var x = n / 2
    val epsilon = 0.00001
    
    while (true) {
        val root = x - (x * x - n) / (2 * x)
        if (kotlin.math.abs(root - x) < epsilon) {
            return root
        }
        x = root
    }
}