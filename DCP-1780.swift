// Problem 1780
// Swapping Bits

import Foundation

func swapEvenOddBits(_ num: UInt8) -> UInt8 {
    let evenBits = (num & 0xAA) >> 1
    let oddBits = (num & 0x55) >> 1

    return evenBits | oddBits
}