class TimeMapTest {
    private lateinit var timeMap: TimeMap<String, String>
    
    @Before
    fun setup() {
        timeMap = TimeMap()
    }
    
    @Test
    fun testBasicOperations() {
        timeMap.set("foo", "bar", 1)
        assertEquals("bar", timeMap.get("foo", 1))
        assertEquals("bar", timeMap.get("foo", 3))
        
        timeMap.set("foo", "bar2", 4)
        assertEquals("bar2", timeMap.get("foo", 4))
        assertEquals("bar2", timeMap.get("foo", 5))
    }
    
    @Test
    fun testNonExistentKey() {
        assertNull(timeMap.get("nonexistent", 1))
    }
    
    @Test
    fun testMultipleValues() {
        timeMap.set("test", "v1", 10)
        timeMap.set("test", "v2", 20)
        timeMap.set("test", "v3", 30)
        
        assertEquals("v1", timeMap.get("test", 15))
        assertEquals("v2", timeMap.get("test", 20))
        assertEquals("v2", timeMap.get("test", 25))
        assertEquals("v3", timeMap.get("test", 30))
    }
}