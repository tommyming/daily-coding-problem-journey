// Problem 1839 (Smallest element in an array)
// Time Complexity is limited to O(logn)

import Foundation

func findSmallestElement<T: Comparable>(_ array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        // If middle element is greater than last element
        // smallest element must be in right half
        if array[mid] > array[right] {
            left = mid + 1
        } else {
            // smallest element is either mid or in left half
            right = mid
        }
    }
    
    return array[left]
}