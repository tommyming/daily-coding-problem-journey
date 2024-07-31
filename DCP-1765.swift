// Problem 1765
// Roman Numeral Expression

import Foundation

// The Dictionary for conversion.
let romanValues: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
]

func romanToDecimal(_ s: String) -> Int {
    var results = 0
    var previousValue = 0

    for char in s.reversed() {
        if let value = romanValues[char] {
            if value < previousValue {
                results -= value
            } else {
                results += value
            }
            previousValue = value
        }
    }

    return result
}