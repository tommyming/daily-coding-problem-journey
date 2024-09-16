// Problem 1786
// The 24 game

import Foundation

func play24Game(_ nums: [Int]) -> Bool {
    func dfs(_ nums: [Double]) -> Bool {
        if nums.count == 1 {
            return abs(nums[0] - 24) < 1e-6
        }
        
        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if i != j {
                    var next = [Double]()
                    for k in 0..<nums.count {
                        if k != i && k != j {
                            next.append(nums[k])
                        }
                    }
                    
                    for op in 0..<4 {
                        if op < 2 && j > i { continue }
                        if op == 0 { next.append(nums[i] + nums[j]) }
                        if op == 1 { next.append(nums[i] - nums[j]) }
                        if op == 2 { next.append(nums[i] * nums[j]) }
                        if op == 3 {
                            if nums[j] != 0 {
                                next.append(nums[i] / nums[j])
                            } else {
                                continue
                            }
                        }
                        if dfs(next) { return true }
                        next.removeLast()
                    }
                }
            }
        }
        return false
    }
    
    return dfs(nums.map { Double($0) })
}