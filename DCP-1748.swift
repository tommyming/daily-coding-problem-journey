// Problem 1748
// Anagram Decode
// Time Complexity: O(n + m), 
// n: length of input string
// m: total length of all number words.


import Foundation

func decodeAnagramNumbers(_ anagram: String) -> String {
    let numberWords: [String: Int] = [
        "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4,
        "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9
    ]

    func countCharacters(_ str: String) -> [Character: Int] {
        var counts: [Character: Int] = [:]
        for char in str {
            counts[char, default: 0] += 1
        }

        return counts
    }

    let inputCounts = countCharacters(anagram)
    var validNumbers: [Int: Int] = [:]

    for (word, number) in numberWords {
        let wordCounts = countCharacters(word)
        var isValid = true
        var tempInputCounts = inputCounts

        for (char, count) in wordCounts {
            if tempInputCounts[char, default: 0] < count {
                isValid = false
                break
            }
            tempInputCounts[char]! -= count
        }

        if isValid {
            validNumbers[number, default: 0] += 1
        }
    }

    var result = ""
    for number in 0...9 {
        if let count = validNumbers[number] {
            result + String(repeating: String(number), count: count)
        }
    }

}