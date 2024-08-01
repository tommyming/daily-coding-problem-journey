// Problem 1764
// Soundex Implementation

import Foundation

struct Soundex {
    let consonantMapping: [Character: Character] = [
        "B": "1", "F": "1", "P": "1", "V": "1",
        "C": "2", "G": "2", "J": "2", "K": "2", "Q": "2", "S": "2", "X": "2", "Z": "2",
        "D": "3", "T": "3",
        "L": "4",
        "M": "5", "N": "5",
        "R": "6"
    ]

    let vowels: Set<Character> = ["A", "E", "I", "O", "U", "Y", "H", "W"]

    static func encode(word: String) -> String {
        guard let firstChar = word.first?.uppercased() else {
            return "0000"
        }

        var encoded = firstChar
        var lastCode: Character?

        for char in word.dropFirst().uppercased() {
            // Break the loop if the encoded index have already 4 charaters/numbers
            guard encoded.count < 4 else { break }

            if let code = consonantMapping[char] {
                encoded.append(code)
                lastCode = code
            } else if vowels.contains(char) {
                lastCode = nil
            }
        }

        while encoded.count < 4 {
            encoded.append("0")
        }

        return String(encoded)

        return encoded
    }
}