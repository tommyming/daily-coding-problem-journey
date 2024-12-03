// Problem 1835 (Median List)

import Foundation

func median(_ list: [Int]) {
    var total = 0
    var counter = 0

    for number in list {
        total += number
        counter += 1
        print(total / counter)
    }
}