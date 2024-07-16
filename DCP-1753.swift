// Problem 1753
// Egyptian Fraction

import Foundation

func egyptianFraction(numerator: Int, denominator: Int) -> [Int] {
    var fractions: [Int] = []
    var num = numerator
    var den = denominator

    while num != 0 {
        let x = Int(ceil(Double(den) / Double(num)))
        fractions.append(x)
        num = x * num - den
        den = den * x

        let gcd = greatestCommonDivisor(num, den)
        num /= gcd
        den /= gcd
    }

    return fractions
}

private func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : greatestCommonDivisor(b, a % b)
}

func formatEgyptianFraction(_ fractions: [Int]) -> String {
    return fractions.map { "1/\($0)" }.joined(separator: " + ")
}

// returns the format method if you want the display.