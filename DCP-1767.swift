// Problem 1767
// Trap Amount of Water

import Foundation

func trap(_ height: [Int]) -> Int {
    guard height.count > 2 else { return 0 }

    var left = 0
    var right = height.count - 1
    var leftMax = 0
    var rightMax = 0
    var water = 0

    while left < right {
        let leftHeight = height[left]
        let rightHeight = height[right]

        if leftHeight < rightHeight {
            water += calculateWater(currentHeight: leftHeight, maxHeight: &leftMax)
            left += 1
        } else {
            water += calculateWater(currentHeight: rightHeight, maxHeight: &rightMax)
            right -= 1
        }
    }

    return water
}

private func calculateWater(currentHeight: Int, maxHeight: inout Int) -> Int {
    if currentHeight >= maxHeight {
        maxHeight = currentHeight
        return 0
    } else {
        return maxHeight - currentHeight
    }
}