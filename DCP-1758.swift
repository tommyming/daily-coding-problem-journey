// Problem 1758
// Array rearrangement
// BUT in linear time in in-place (O(n) + without buffer).

import Foundation

func segregateRGB(_ array: inout [Character]) {
    var redIndex = 0
    var greenIndex = 0
    var blueIndex = array.count - 1

    while greenIndex <= blueIndex {
        switch array[greenIndex] {
        case "R":
            array.swapAt(redIndex, greenIndex)
            redIndex += 1
            greenIndex += 1
        case "G":
            greenIndex += 1
        case "B":
            array.swapAt(greenIndex, blueIndex)
            blueIndex -= 1
        default:
            fatalError("Invalid Characters.")
        }
    }
}

// This code using "Dutch National Flag Algorithm" to solve the problem.
// You may search about it to understand the algorithm.