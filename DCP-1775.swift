// Problem 1775
// Check Secret Code Guess

import Foundation

func isValidMastermindSequence(_ scores: [Int: Int]) -> Bool {
    // Helper function to count matching digits
    func countMatches(_ code: [Int], _ guess: [Int]) -> Int {
        return zip(code, guess).filter { $0 == $1 }.count
    }
    
    // Generate all possible 6-digit codes with distinct digits
    func generateCodes() -> [[Int]] {
        return (0...9).combinations(ofCount: 6).map { Array($0) }
    }
    
    // Convert integer to array of digits
    func toDigits(_ num: Int) -> [Int] {
        return String(num).compactMap { Int(String($0)) }
    }
    
    let possibleCodes = generateCodes()
    
    // Check each possible code against all guesses
    for code in possibleCodes {
        if scores.allSatisfy({ (guess, score) in
            countMatches(code, toDigits(guess)) == score
        }) {
            return true
        }
    }
    
    return false
}