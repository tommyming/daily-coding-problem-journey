import Foundation

func checkIsNumber(_ numberString: String) -> Bool {
    // Regular expression to check if the string is a number
    // `^[+-]?` matches an optional leading "+" or "-"
    // `((\\d+\\.?\\d*)|(\\.\\d+))` matches a number with or without a decimal point
    // `([eE][+-]?\\d+)?` matches an optional exponent
    // `$` matches the end of the string
    let numberRegex = "^[+-]?((\\d+\\.?\\d*)|(\\.\\d+))([eE][+-]?\\d+)?$"
    let numberPredicate = NSPredicate("SELF MATCHES %@", numberRegex)
    return numberPredicate.evaluate(with: numberString)
}