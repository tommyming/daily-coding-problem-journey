// Problem 1835

fun median(_ list: IntArray) {
    var total = 0
    var count = 0

    for number in list {
        total += number
        count++
        println(total / count)
    }
}