// Problem 1841 (k pairs with greatest similarity)

import Foundation

struct WebsiteSimilarity {
    let website1: String
    let website2: String
    let similarity: Double
}

func findMostSimilarWebsites(_ visits: [(String, Int)], k: Int) -> [(String, String)] {
    // Create a dictionary of website to set of users
    var websiteUsers: [String: Set<Int>] = [:]
    
    // Group users by website
    for (website, user) in visits {
        websiteUsers[website, default: Set()].insert(user)
    }
    
    // Calculate similarities between all pairs
    var similarities: [WebsiteSimilarity] = []
    let websites = Array(websiteUsers.keys)
    
    for i in 0..<websites.count {
        for j in (i + 1)..<websites.count {
            let site1 = websites[i]
            let site2 = websites[j]
            
            let users1 = websiteUsers[site1]!
            let users2 = websiteUsers[site2]!
            
            // Calculate Jaccard similarity
            let intersection = users1.intersection(users2).count
            let union = users1.union(users2).count
            let similarity = Double(intersection) / Double(union)
            
            similarities.append(WebsiteSimilarity(
                website1: site1,
                website2: site2,
                similarity: similarity
            ))
        }
    }
    
    // Sort by similarity and take top k
    return similarities
        .sorted { $0.similarity > $1.similarity }
        .prefix(k)
        .map { ($0.website1, $0.website2) }
}