class TimeMap<K, V> {
    private val storage = mutableMapOf<K, MutableList<Pair<Int, V>>>()
    
    fun set(key: K, value: V, timestamp: Int) {
        storage.getOrPut(key) { mutableListOf() }
            .add(Pair(timestamp, value))
    }
    
    fun get(key: K, timestamp: Int): V? {
        val values = storage[key] ?: return null
        
        var left = 0
        var right = values.size - 1
        var result: V? = null
        
        while (left <= right) {
            val mid = (left + right) / 2
            val currentTimestamp = values[mid].first
            
            if (currentTimestamp <= timestamp) {
                result = values[mid].second
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}