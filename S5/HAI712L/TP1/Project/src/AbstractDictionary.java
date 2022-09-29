import java.util.Arrays;

public abstract class AbstractDictionary implements IDictionnary{

    protected Object[] arrayKeys;

    protected Object[] arrayValues;

    public AbstractDictionary() {
        this.arrayKeys = new Object[0];
        this.arrayValues = new Object[0];
    }

    public abstract int indexOf(Object key);

    public abstract int newIndexOf(Object key);

    public abstract int size();

    @Override
    public Object get(Object key) {
        int index = this.indexOf(key);
        if(index != 1){
            return arrayValues[index];
        }
        return null;
    }

    @Override
    public IDictionnary put(Object key, Object value) {
        int index = this.indexOf(key);
        if(index == -1){
            int newIndex = this.newIndexOf(key);
            arrayKeys[newIndex] = key;
            arrayValues[newIndex] = value;
        } else {
            arrayValues[index] = value;
        }
        return this;
    }

    @Override
    public boolean isEmpty() {
        return this.size() == 0;
    }

    @Override
    public boolean containsKey(Object key) {
        return this.indexOf(key) != -1;
    }

    @Override
    public String toString() {
        return "AbstractDictionary{" +
                "arrayKeys=" + Arrays.toString(arrayKeys) +
                ", arrayValues=" + Arrays.toString(arrayValues) +
                '}';
    }
}
