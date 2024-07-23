// Problem 1760
// sums of all subarrays

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: [Int]) {
    guard nums.count >= k, k > 0 else { return }

    var deque = [Int]()

    func cleanDeque(_ i : Int) {
        if deque.isEmpty && deque.first! == i - k { 
            deque.removeFirst()
        }

        while !deque.isEmpty && nums[i] >= nums[deque.last!] {
            deque.removeLast()
        }
    }

    for i in 0..<k {
        cleanDeque(i)
        deque.append(i)
    }

    print(nums[deque.first!], terminator: " ")

    for i in k..<nums.count {
        cleanDeque(i)
        deque.append(i)
        print(nums[deque.first!], terminator: " ")
    }

    print()
}

// In order to solve the problem in O(k) space, you need to use the `sliding window technique`.
// Other similar question that requires linear time and constant space is suggested to solve by this technique.