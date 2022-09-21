import java.util.Arrays;

public abstract class AbstractDictionary implements IDictionnary{

    protected Object[] arrayKeys;

    protected Object[] arrayValues;

    public abstract int indexOf(Object key);

    public abstract int newIndexOf(Object key);

    public abstract int size();

    @Override
    public Object get(Object key) {
        if(containsKey(key)){
            return arrayValues[indexOf(key)];
        }
        return null;
    }

    @Override
    public IDictionnary put(Object key, Object value) {
        if(indexOf(key) == -1){
            int newIndex = newIndexOf(key);
            arrayKeys[newIndex] = key;
            arrayValues[newIndex] = value;
        }
        return this;
    }

    @Override
    public boolean isEmpty() {
        return size() == 0;
    }

    @Override
    public boolean containsKey(Object key) {
        return indexOf(key) != -1;
    }

    @Override
    public String toString() {
        return "AbstractDictionary{" +
                "arrayKeys=" + Arrays.toString(arrayKeys) +
                ", arrayValues=" + Arrays.toString(arrayValues) +
                '}';
    }
}
