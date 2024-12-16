// Problem 1842 (Major element in Array)
// First Solution: using Hash table to store the count of each element
// Optimal Solution: using Boyer-Moore Voting Algorithm

import Foundation

func findMajorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var candidate: Int?

    for num in nums {
        if count == 0 {
            candidate = num
        }
        count += (num == candidate) ? 1 : -1
    }

    return candidate!
}
