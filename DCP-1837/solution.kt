// Problem 1837

class StableMarriage(
    private val menPreferences: Map<String, List<String>>,
    private val womenPreferences: Map<String, List<String>>
) {
    fun match(): Map<String, String> {
        val freeMen = menPreferences.keys.toMutableSet()
        val currentMatches = mutableMapOf<String, String>()
        val womenRankings = womenPreferences.mapValues { (_, prefs) ->
            prefs.withIndex().associate { it.value to it.index }
        }
        
        while (freeMen.isNotEmpty()) {
            val man = freeMen.first()
            val preferences = menPreferences[man] ?: continue
            
            for (woman in preferences) {
                if (woman !in currentMatches.values) {
                    currentMatches[man] = woman
                    freeMen.remove(man)
                    break
                } else {
                    val currentMan = currentMatches.entries.first { it.value == woman }.key
                    val currentRank = womenRankings[woman]?.get(currentMan) ?: 0
                    val newRank = womenRankings[woman]?.get(man) ?: 0
                    
                    if (newRank < currentRank) {
                        currentMatches[man] = woman
                        freeMen.remove(man)
                        freeMen.add(currentMan)
                        break
                    }
                }
            }
        }
        
        return currentMatches
    }
}