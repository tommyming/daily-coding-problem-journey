// Problem 1834 (Minimum Swaps for couples to find eacth other)

import Foundation

func minSwapsToCouple(_ row: [Int]) -> Int {
    var row = row
    let n = row.count / 2
    var positionMap = [Int: Int]()
    
    // Create position map
    for (index, value) in row.enumerated() {
        positionMap[value] = index
    }
    
    var swaps = 0
    
    // Process each even position
    for i in stride(from: 0, to: 2 * n, by: 2) {
        let partner = row[i] ^ 1 // Get partner using XOR
        if row[i + 1] != partner {
            let swapIndex = positionMap[partner]!
            
            // Update position map
            positionMap[row[i + 1]] = swapIndex
            positionMap[partner] = i + 1
            
            // Perform swap
            row.swapAt(i + 1, swapIndex)
            swaps += 1
        }
    }
    
    return swaps
}