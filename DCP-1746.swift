// Problem 1746
// Yet Another Famous Problem

import Foundation

func generateRandomNumber(numbers: [Int], probabilities: [Double]) -> Int {
    // Ensure the input is valid
    guard numbers.count == probabilities.count, numbers.count > 0 else {
        print("Invalid input")
        return -1
    }

    let totalProbability = probabilities.reduce(0, +)
    // 1e-10 is a scientific notation for 0.0000000001
    guard abs(totalProbability - 1.0) < (1e-10) else {
        print("Invalid probabilities")
        return -1
    }

    let randomValue = Double.random(in: 0...1)

    var cumulativeProbability = 0.0
    for (index, probability) in probabilities.enumerated() {
        cumulativeProbability += probability
        if randomValue < cumulativeProbability {
            return numbers[index]
        }
    }

    // This is just a corner case, if there are some problems with Swift's floating point arithmetic.
    return numbers.last!
}