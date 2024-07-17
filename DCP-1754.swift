// Problem 1754
// Strobogrammatic Number

func findStrobogrammatic(_ n: Int) -> [String] {
    func generate(_ length: Int) -> [String] {
        if length == 0 { return [""] }

        if length == 1 { return ["0", "1", "8"] }

        let middles = generate(length - 2)
        var result: [String] = []

        for middle in middles {
            if length != n {
                result.append("0" + middle + "0")
            }
            result.append("1" + middle + "1")
            result.append("6" + middle + "9")
            result.append("8" + middle + "8")
            result.append("9" + middle + "6")
        }

        return result
    }

    return generate(n)
}

// TODO: The approach could be slightly better if we use a dicitonary/map to identify the wording to be clearer.