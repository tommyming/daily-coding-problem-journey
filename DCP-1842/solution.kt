fun findMajorityElement(nums: IntArray): Int {
    var count = 0
    var candidate: Int? = null

    for (num in nums) {
        if (count == 0) {
            candidate = num
        }
        count += if (num == candidate) 1 else -1
    }

    return candidate!!
}
