// Problem 1836

// ad-hoc polymorphism
fun doubleof(a: Int): Int {
    return 2 * a
}

fun doubleof(a: Double): Double {
    return 2.00 * a
}

// Usage
println(doubleof(4))    // Prints 8
println(doubleof(4.3))  // Prints 8.6

// parametric polymorphism
class Box<T> {
    private var content: T? = null
    
    fun put(item: T) {
        content = item
    }
    
    fun get(): T? {
        return content
    }
}

// Usage
val numberBox = Box<Int>()
numberBox.put(42)
val stringBox = Box<String>()
stringBox.put("Hello Generics")

// subtyping polymorphism
open class Sup {
    open fun method1() {
        println("printing method 1 from inside Sup")
    }
}

class Sum: Sup() {
    override fun method1() {
        println("printing method 1 from inside Sum")
    }
}

// Usage
val b = Sum()
b.method1()  // Prints "printing method 1 from inside Sum"