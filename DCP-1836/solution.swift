
// Problem 1836 (Code examples of Polymorphism)

import Foundation

// ad-hoc polymorphism
func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func sum(_ a: String, _ b: String) -> String {
    return a + b
}

// Usage
let numberResult = sum(3, 5)      // Returns 8
let stringResult = sum("ad", "hoc") // Returns "adhoc"

// parametric polymorphism
struct CargoHold<T> {
    var items: [T] = []
    
    mutating func addItem(_ item: T) {
        items.append(item)
    }
}

// Usage
var intCargoHold = CargoHold<Int>()
intCargoHold.addItem(100)

var stringCargoHold = CargoHold<String>()
stringCargoHold.addItem("Medical Supplies")

class Shape {
    func draw() {
        print("Drawing a shape")
    }
}

class Circle: Shape {
    override func draw() {
        print("Drawing a circle")
    }
}

// Usage
func drawShape(shape: Shape) {
    shape.draw()
}

drawShape(shape: Circle())  // Prints "Drawing a circle"