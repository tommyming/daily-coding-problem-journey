// Problem 1766
// Finding Complete Overlap Sub Ranges

import Foundation

struct Interval {
    var start: Int
    var end: Int
}

func mergeIntervals(_ intervals: [(Int, Int)]) -> [Interval] {
    let sortedIntervals = intervals.map { Interval(start: $0.0, end: $0.1) }
            .sorted { $0.start < $1.start }

    var result = [Interval]()

    for interval in sortedIntervals {
        if result.isEmpty || interval.start > result.last!.end {
            result.append(interval)
        } else {
            result[result.count - 1].end = max(result.last!.end, interval.end)
        }
    }

    return result
}