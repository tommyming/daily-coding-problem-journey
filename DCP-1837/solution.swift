// Problem 1837 (Stable Marriage Problem)

import Foundation

struct StableMarriage {
    let menPreferences: [String: [String]]
    let womenPreferences: [String: [String]]
    
    func match() -> [String: String] {
        var freeMen = Set(menPreferences.keys)
        var currentMatches = [String: String]()
        var womenRankings: [String: [String: Int]] = [:]
        
        // Precompute rankings for O(1) lookup
        for (woman, prefs) in womenPreferences {
            womenRankings[woman] = [:]
            for (rank, man) in prefs.enumerated() {
                womenRankings[woman]?[man] = rank
            }
        }
        
        while let man = freeMen.first {
            let preferences = menPreferences[man] ?? []
            for woman in preferences {
                if !currentMatches.values.contains(woman) {
                    currentMatches[man] = woman
                    freeMen.remove(man)
                    break
                } else {
                    let currentMan = currentMatches.first { $0.value == woman }!.key
                    let currentRank = womenRankings[woman]?[currentMan] ?? 0
                    let newRank = womenRankings[woman]?[man] ?? 0
                    
                    if newRank < currentRank {
                        currentMatches[man] = woman
                        freeMen.remove(man)
                        freeMen.insert(currentMan)
                        break
                    }
                }
            }
        }
        
        return currentMatches
    }
}