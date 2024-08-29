// Problem 1783
// divided spaces

import Foundation

class DisjointSet {
    private var parent: [Int]
    private var rank: [Int]
    
    init(_ size: Int) {
        parent = Array(0..<size)
        rank = Array(repeating: 0, count: size)
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            if rank[rootX] < rank[rootY] {
                parent[rootX] = rootY
            } else if rank[rootX] > rank[rootY] {
                parent[rootY] = rootX
            } else {
                parent[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
}

func regionsBySlashes(_ grid: [String]) -> Int {
    let n = grid.count
    let ds = DisjointSet(4 * n * n)
    
    for i in 0..<n {
        for j in 0..<n {
            let index = 4 * (i * n + j)
            let cell = grid[i][grid[i].index(grid[i].startIndex, offsetBy: j)]
            
            if cell != "/" {
                ds.union(index + 0, index + 1)
                ds.union(index + 2, index + 3)
            }
            if cell != "\\" {
                ds.union(index + 0, index + 3)
                ds.union(index + 1, index + 2)
            }
            
            if i > 0 { ds.union(index + 0, index - 4 * n + 2) }
            if j > 0 { ds.union(index + 3, index - 4 + 1) }
        }
    }
    
    var regions = Set<Int>()
    for i in 0..<4*n*n {
        regions.insert(ds.find(i))
    }
    
    return regions.count
}