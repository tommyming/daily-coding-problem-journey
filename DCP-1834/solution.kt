fun minSwapsToCouple(row: IntArray): Int {
    val n = row.size / 2
    val positionMap = mutableMapOf<Int, Int>()
    
    // Create position map
    row.forEachIndexed { index, value ->
        positionMap[value] = index
    }
    
    var swaps = 0
    
    // Process each even position
    for (i in 0 until 2 * n step 2) {
        val partner = row[i] xor 1 // Get partner using XOR
        if (row[i + 1] != partner) {
            val swapIndex = positionMap[partner]!!
            
            // Update position map
            positionMap[row[i + 1]] = swapIndex
            positionMap[partner] = i + 1
            
            // Perform swap
            row[i + 1] = row[swapIndex].also { row[swapIndex] = row[i + 1] }
            swaps++
        }
    }
    
    return swaps
}