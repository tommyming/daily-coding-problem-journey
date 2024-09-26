// Problem 1800
// Palindrome checker

import Foundation

func isPalindrome(_ num: Int) -> Bool {
    if num < 0 {
        return false // Negative numbers are not palindromes
    }
    
    var original = num
    var reversed = 0
    
    while original > 0 {
        let digit = original % 10
        reversed = reversed * 10 + digit
        original /= 10
    }
    
    return num == reversed
}