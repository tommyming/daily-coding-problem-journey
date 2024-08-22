// Problem 1778
// Biggest sum of non-adjacent numbers

import Foundation

func largestSumOfNonAdjacentNumbers(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    guard nums.count > 1 else { return nums[0] }

    var inclusive = nums[0]
    var exclusive = 0

    for i in 1..<nums.count {
        let temp = inclusive
        inclusive = max(inclusive, exclusive + nums[i])
        exclusive = temp
    }

    return max(inclusive, exclusive)
}