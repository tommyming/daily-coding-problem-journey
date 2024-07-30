// Problem 1767
// Trap Amount of Water

import Foundation

func trap(_ height: [Int]) -> Int {
    // Suppose there is a wall of height 0 at the leftmost and rightmost position
    guard height.count > 2 else { return 0 }

    var left = 0
    var right = height.count - 1
    var leftMax = 0
    var rightMax = 0
    var water = 0

    while left < right {
        if height[left] < height[right] {

            // If the current height is greater than the leftMax, update the leftMax
            // The water that is trapped will be counted into puddle.
            if height[left] >= leftMax {
                leftMax = height[left]
            } else {
                water += leftMax - height[left]
            }
            left += 1
        } else {
            // right side is doing the same thing.
            if height[right] >= rightMax {
                rightMax = height[right]
            } else {
                water += rightMax - height[right]
            }
            right -= 1
        }
    }

    return water
}