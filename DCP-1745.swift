// Question 1745
// aka, the famous Celebrity Problem.

import Foundation

struct CelebrityFinder {
    func knows(_ a: Int, b: Int) -> Bool {
        // Suppose there are requirements of the knowing relationship
        // Will leave the function here just in case.
        return false
    }

    func find(_ n: Int) -> Int {
        var stack = Array(0..<n)

        // Elimination
        while stack.count >= 2 {
            let a = stack.popLast()!
            let b = stack.popLast()!

            // If a knows b, then a is not a celebrity
            if knows(a, b) {
                stack.append(b)
            } else {
                stack.append(a)
            }
        }

        // Potential Candidate
        let candidate = stack.first!

        // Verification
        for i in stack.count {
            if i != candidate, (knows(candidate, i) || !knows(i, candidate)) {
                return -1
            }
        }

        return candidate
    }
}