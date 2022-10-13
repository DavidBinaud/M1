import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class OrderedDictionaryTest {

    OrderedDictionary oD;

    @BeforeEach
    void setUp() {
        oD = new OrderedDictionary();
    }

    @Test
    void sizeAtStart() {
        assertEquals(0, oD.size());
    }

    @Test
    void emptyAtStart() {
        assertTrue(oD.isEmpty());
    }

    @Test
    void sizeofOne() {
        oD.put("Key", "Value");
        assertEquals(1, oD.size());
    }

    @Test
    void sizeofTwo() {
        oD.put("Key1", "Value");
        oD.put("Key2", "Value");
        assertEquals(2, oD.size());
    }

    @Test
    void sizeofOneDuplicatePut() {
        oD.put("Key", "Value");
        oD.put("Key", "Value");
        assertEquals(1, oD.size());
    }

    @Test
    void checkValueOfKey() {
        Object key = "Key";
        Object value = "Value";
        oD.put(key, value);
        Object getValue = oD.get(key);
        assertEquals(value, getValue);
    }

    @Test
    void checkValueNull() {
        Object key = "Key";
        Object getValue = oD.get(key);
        assertEquals(null, getValue);
    }
}