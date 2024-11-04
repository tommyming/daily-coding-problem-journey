import XCTestCase

class TimeMapTests: XCTestCase {
    var timeMap: TimeMap<String, String>!
    
    override func setUp() {
        timeMap = TimeMap()
    }
    
    func testBasicOperations() {
        timeMap.set(key: "foo", value: "bar", timestamp: 1)
        XCTAssertEqual(timeMap.get(key: "foo", timestamp: 1), "bar")
        XCTAssertEqual(timeMap.get(key: "foo", timestamp: 3), "bar")
        
        timeMap.set(key: "foo", value: "bar2", timestamp: 4)
        XCTAssertEqual(timeMap.get(key: "foo", timestamp: 4), "bar2")
        XCTAssertEqual(timeMap.get(key: "foo", timestamp: 5), "bar2")
    }
    
    func testNonExistentKey() {
        XCTAssertNil(timeMap.get(key: "nonexistent", timestamp: 1))
    }
    
    func testMultipleValues() {
        timeMap.set(key: "test", value: "v1", timestamp: 10)
        timeMap.set(key: "test", value: "v2", timestamp: 20)
        timeMap.set(key: "test", value: "v3", timestamp: 30)
        
        XCTAssertEqual(timeMap.get(key: "test", timestamp: 15), "v1")
        XCTAssertEqual(timeMap.get(key: "test", timestamp: 20), "v2")
        XCTAssertEqual(timeMap.get(key: "test", timestamp: 25), "v2")
        XCTAssertEqual(timeMap.get(key: "test", timestamp: 30), "v3")
    }
}