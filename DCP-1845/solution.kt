fun findNearestLargerIndex(array: List<Int>, index: Int): Int? {
    val target = array[index]
    var leftIndex = index - 1
    var rightIndex = index + 1
    
    while (leftIndex >= 0 || rightIndex < array.size) {
        // Check right side
        if (rightIndex < array.size && array[rightIndex] > target) {
            return rightIndex
        }
        
        // Check left side
        if (leftIndex >= 0 && array[leftIndex] > target) {
            return leftIndex
        }
        
        leftIndex--
        rightIndex++
    }
    
    return null
}
