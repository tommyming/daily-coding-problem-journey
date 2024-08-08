// Problem 1770
// Matrix Conversion

func floodFill(_ image: inout [[Int]], sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    let originalColor = image[sr][sc]
    if originalColor == newColor { return image }

    let rows = image.count
    let columns = image[0].count

    func dfs(_ r: Int, _ c: Int) {
        if r < 0 || c < 0 || r >= rows || c >= columns || image[r][c] != originalColor {
            return
        }

        image[r][c] = newColor

        dfs(r - 1, c)
        dfs(r + 1, c)
        dfs(r, c - 1)
        dfs(r, c + 1)
    }

    dfs(sr, sc)
    return image
}

// Identify the connected components of the matrix
// For each component, if the component is not on the border, change the color to newColor
// Return the modified matrix