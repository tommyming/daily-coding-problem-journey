// Problem 1771
// Expression Parser

import Foundation

func evaluateExpression(_ s: String) -> Int {
    func helper(_ index: inout Int) -> Int {
        var num = 0
        var sign = 1
        var stack = [Int]()

        while index < s.count {
            let char = s[s.index(s.startIndex, offsetBy: index)]

            if char.isNumber {
                num = num * 10 + Int(String(char))!
            } else if char == "+" || char == "-" {
                num *= sign
                stack.append(num)
                num = 0
                sign = char == "+" ? 1 : -1
            } else if char == "(" {
                index += 1
                num = helper(&index)
            } else if char == ")" {
                num *= sign
                stack.append(num)
                return stack.reduce(0, +)
            }

            index += 1
        }

        num *= sign
        stack.append(num)
        return stack.reduce(0, +)
    }

    var index = 0
    return helper(&index)
}