fun <T : Comparable<T>> findSmallestElement(array: Array<T>): T? {
    if (array.isEmpty()) return null
    
    var left = 0
    var right = array.lastIndex
    
    while (left < right) {
        val mid = left + (right - left) / 2
        
        // If middle element is greater than last element
        // smallest element must be in right half
        if (array[mid] > array[right]) {
            left = mid + 1
        } else {
            // smallest element is either mid or in left half
            right = mid
        }
    }
    
    return array[left]
}

// Extension function for List
fun <T : Comparable<T>> List<T>.findSmallestElement(): T? {
    if (isEmpty()) return null
    
    var left = 0
    var right = lastIndex
    
    while (left < right) {
        val mid = left + (right - left) / 2
        
        if (this[mid] > this[right]) {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return this[left]
}