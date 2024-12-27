// Problem 1845

import Foundation

func findNearestLargerIndex(_ array: [Int], _ index: Int) -> Int? {
    let target = array[index]
    var leftIndex = index - 1
    var rightIndex = index + 1
    
    while leftIndex >= 0 || rightIndex < array.count {
        // Check right side
        if rightIndex < array.count && array[rightIndex] > target {
            return rightIndex
        }
        
        // Check left side
        if leftIndex >= 0 && array[leftIndex] > target {
            return leftIndex
        }
        
        leftIndex -= 1
        rightIndex += 1
    }
    
    return nil
}
