// Problem 1838

fun countSmallerElements(nums: IntArray): IntArray {
    val result = IntArray(nums.size)
    
    for (i in nums.indices) {
        var count = 0
        for (j in (i + 1) until nums.size) {
            if (nums[j] < nums[i]) {
                count++
            }
        }
        result[i] = count
    }
    return result
}