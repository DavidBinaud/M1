public class OrderedDictionary extends AbstractDictionary{

    public OrderedDictionary() {
        this.arrayKeys = new Object[0];
        this.arrayValues = new Object[0];
    }

    @Override
    public int indexOf(Object key) {
        if(isEmpty()) return -1;
        int i = 0;
        while(i < size() && !arrayKeys[i].equals(key)){
            i++;
        }
        return i != size() ? i : -1;
    }

    @Override
    public int newIndexOf(Object key) {
        Object[] newArrayKeys = new Object[size()+1];
        Object[] newArrayValues = new Object[size()+1];
        for (int i = 0; i < size(); i++) {
            newArrayKeys[i] = this.arrayKeys[i];
            newArrayValues[i] = this.arrayValues[i];
        }
        int indexToInsert = size();
        this.arrayKeys = newArrayKeys;
        this.arrayValues = newArrayValues;

        return indexToInsert;
    }

    @Override
    public int size() {
        return this.arrayKeys.length;
    }
}
