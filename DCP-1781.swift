// Problem 1781
// Unit Conversion System

import Foundation

// Define a struct to represent a measurement
struct Measurement {
    let value: Double
    let unit: Unit
    
    func convert(to targetUnit: Unit) -> Measurement {
        let baseValue = unit.toBase(value)
        let convertedValue = targetUnit.fromBase(baseValue)
        return Measurement(value: convertedValue, unit: targetUnit)
    }
}

// Define an enum for different units
enum Unit: String, CaseIterable {
    case inch
    case foot
    case yard
    case chain
    case mile
    
    // Base unit is inches
    private var toBaseMultiplier: Double {
        switch self {
        case .inch: return 1
        case .foot: return 12
        case .yard: return 36
        case .chain: return 792 // 22 yards * 36 inches
        case .mile: return 63360 // 5280 feet * 12 inches
        }
    }
    
    func toBase(_ value: Double) -> Double {
        return value * toBaseMultiplier
    }
    
    func fromBase(_ value: Double) -> Double {
        return value / toBaseMultiplier
    }
}

// Extension to add new units dynamically
extension Unit {
    static var customUnits: [String: Double] = [:]
    
    static func addCustomUnit(name: String, inchesPerUnit: Double) {
        customUnits[name] = inchesPerUnit
    }
}

// Extension to handle custom units in conversion
extension Measurement {
    init?(value: Double, unitName: String) {
        if let standardUnit = Unit(rawValue: unitName) {
            self.init(value: value, unit: standardUnit)
        } else if let customMultiplier = Unit.customUnits[unitName] {
            self.value = value
            self.unit = Unit.inch
            self.value *= customMultiplier
        } else {
            return nil
        }
    }
    
    func convert(to targetUnitName: String) -> Measurement? {
        if let standardUnit = Unit(rawValue: targetUnitName) {
            return convert(to: standardUnit)
        } else if let customMultiplier = Unit.customUnits[targetUnitName] {
            let baseValue = unit.toBase(value)
            let convertedValue = baseValue / customMultiplier
            return Measurement(value: convertedValue, unitName: targetUnitName)
        }
        return nil
    }
}