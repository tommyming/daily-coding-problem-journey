// Problem 1747
// Find all possible permutation combinations

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    // suppose need to have at least 2 numbers to perform permutations.
    guard nums.count > 1 else { return [nums] }

    var result: [[Int]] = [[]]

    for (index, num) in nums.enumerated() {
        var remainingNums = nums
        remainingNums.remove(at: index)

        let subPermutations = permute(remainingNums)

        for var subPermutation in subPermutations {
            subPermutation.insert(num, at: 0)
            result.append(subPermutation)
        }
    }

    return result
}