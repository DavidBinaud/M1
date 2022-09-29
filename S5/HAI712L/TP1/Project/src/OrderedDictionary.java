import java.util.Arrays;

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
        int size = this.size();
        if(size == this.arrayKeys.length){
            this.grow();
            return arrayKeys.length - 1;
        }
        else return size;
    }

    private void grow(){
        int indexToInsert = size();
        this.arrayKeys = Arrays.copyOf(arrayKeys, indexToInsert+1);
        this.arrayValues = Arrays.copyOf(arrayValues, indexToInsert+1);
    }
    @Override
    public int size() {
        return this.arrayKeys.length;
    }
}
