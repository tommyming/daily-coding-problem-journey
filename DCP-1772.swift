// Problem 1772
// Jump Counter

import Foundation

func minimumJumps(to target: Int) -> Int {
    guard target != 0 else { return 0 }
    
    var queue = [(position: 0, jumps: 0)]
    var visited = Set<Int>()
    
    while !queue.isEmpty {
        let (position, jumps) = queue.removeFirst()
        
        for i in 1...Int.max {
            let leftPosition = position - i
            let rightPosition = position + i
            
            if rightPosition == target || leftPosition == target {
                return jumps + 1
            }
            
            if !visited.contains(rightPosition) && abs(rightPosition) <= 10000 {
                visited.insert(rightPosition)
                queue.append((rightPosition, jumps + 1))
            }
            
            if !visited.contains(leftPosition) && abs(leftPosition) <= 10000 {
                visited.insert(leftPosition)
                queue.append((leftPosition, jumps + 1))
            }
            
            if rightPosition > target && leftPosition < target {
                break
            }
        }
    }
    
    return -1 // If no path is found
}

// a question: The function limits the jumps counting to 10,000. How about N > 10,000?