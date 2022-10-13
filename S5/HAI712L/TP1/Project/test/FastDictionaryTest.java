import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class FastDictionaryTest {

    FastDictionary fD;

    @BeforeEach
    void setUp() {
        fD = new FastDictionary();
    }

    @Test
    void sizeAtStartZero() {
        assertEquals(0, fD.size());
    }

    @Test
    void emptyAtStart() {
        assertTrue(fD.isEmpty());
    }

    @Test
    void sizeofOne() {
        fD.put("Key", "Value");
        assertEquals(1, fD.size());
    }

    @Test
    void sizeofTwo() {
        fD.put("Key1", "Value");
        fD.put("Key2", "Value");
        assertEquals(2, fD.size());
    }

    @Test
    void sizeofOneDuplicatePut() {
        fD.put("Key", "Value");
        fD.put("Key", "Value");
        assertEquals(1, fD.size());
    }

    @Test
    void checkValueOfKey() {
        Object key = "Key";
        Object value = "Value";
        fD.put(key, value);
        Object getValue = fD.get(key);
        assertEquals(value, getValue);
    }

    @Test
    void checkValueNull() {
        Object key = "Key";
        Object getValue = fD.get(key);
        assertEquals(null, getValue);
    }
}