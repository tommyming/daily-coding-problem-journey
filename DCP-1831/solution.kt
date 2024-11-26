fun findSmallestMissingSum(arr: IntArray): Int {
    var result = 1
    
    for (num in arr) {
        if (num > result) {
            return result
        }
        result += num
    }
    
    return result
}