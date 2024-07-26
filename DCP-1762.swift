// Problem 1762
// Boolean Expression counter

import Foundation

func evaluateExpression(_ expression: [String]) -> Int {
    let n = expression.count
    var dpTrue = Array(repeating: Array(repeating: 0, count: n), count: n)
    var dpFalse = Array(repeating: Array(repeating: 0, count: n), count: n) 

    for i in stride(from: 0, to: n, by: 2) {
        if expression[i] == "T" {
            dpTrue[i][i] = 1
            dpFalse[i][i] = 0
        } else {
            dpTrue[i][i] = 0
            dpFalse[i][i] = 1
        }
    }   

    for len in stride(from: 3, to: n, by: 2) {
        for i in stride(from: 0, to: n - len + 1, by: 2) {
            let j = i + len - 1
            for k in stride(from: i + 1, to: j, by: 2) {
                let totalIK = (dpTrue[i][k-1] + dpFalse[i][k-1]) * (dpTrue[k+1][j] + dpFalse[k+1][j])
                
                switch expression[k] {
                case "&":
                    dpTrue[i][j] += dpTrue[i][k-1] * dpTrue[k+1][j]
                    dpFalse[i][j] += totalIK - (dpTrue[i][k-1] * dpTrue[k+1][j])
                case "|":
                    dpFalse[i][j] += dpFalse[i][k-1] * dpFalse[k+1][j]
                    dpTrue[i][j] += totalIK - (dpFalse[i][k-1] * dpFalse[k+1][j])
                case "^":
                    dpTrue[i][j] += dpTrue[i][k-1] * dpFalse[k+1][j] + dpFalse[i][k-1] * dpTrue[k+1][j]
                    dpFalse[i][j] += dpTrue[i][k-1] * dpTrue[k+1][j] + dpFalse[i][k-1] * dpFalse[k+1][j]
                default:
                    break
                }
            }
        }
    }

    return dpTrue[0][n-1]
}

// This is a very complex question, tbh.
