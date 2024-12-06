// Problem 1838 (count smaller elements on the right)

import Foundation

func countSmallerElements(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<nums.count {
        var count = 0
        for j in (i + 1)..<nums.count {
            if nums[j] < nums[i] {
                count += 1
            }
        }
        result.append(count)
    }
    return result
}