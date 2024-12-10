data class WebsiteSimilarity(
    val website1: String,
    val website2: String,
    val similarity: Double
)

fun findMostSimilarWebsites(visits: List<Pair<String, Int>>, k: Int): List<Pair<String, String>> {
    // Create a map of website to set of users
    val websiteUsers = visits.groupBy(
        keySelector = { it.first },
        valueTransform = { it.second }
    ).mapValues { it.value.toSet() }
    
    // Calculate similarities between all pairs
    val similarities = mutableListOf<WebsiteSimilarity>()
    val websites = websiteUsers.keys.toList()
    
    for (i in websites.indices) {
        for (j in i + 1 until websites.size) {
            val site1 = websites[i]
            val site2 = websites[j]
            
            val users1 = websiteUsers[site1]!!
            val users2 = websiteUsers[site2]!!
            
            // Calculate Jaccard similarity
            val intersection = users1.intersect(users2).size
            val union = users1.union(users2).size
            val similarity = intersection.toDouble() / union.toDouble()
            
            similarities.add(WebsiteSimilarity(site1, site2, similarity))
        }
    }
    
    // Sort by similarity and take top k
    return similarities
        .sortedByDescending { it.similarity }
        .take(k)
        .map { Pair(it.website1, it.website2) }
}