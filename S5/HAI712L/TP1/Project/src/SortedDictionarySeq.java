import java.util.Arrays;

public class SortedDictionarySeq extends OrderedDictionary {
    public SortedDictionarySeq(){
        super();
    }

    @Override
    public int newIndexOf(Object key) {
        Comparable comparableKey = (Comparable) key;
        int size = this.size();
        if(size == this.arrayKeys.length){
            this.grow(0);
            return arrayKeys.length - 1;
        }
        else return size;
    }

    /*
    * On laisse une case vide au milieu du tableau à l'index défini pour l'insertion
    */
    private void grow(int index){
        int oldSize = this.size();
        Object[] newArrayKeys = new Object[oldSize+1];
        Object[] newArrayValues = new Object[oldSize+1];
        for (int i = 0; i < index; i++) {
            newArrayKeys[i] = this.arrayKeys[i];
            newArrayValues[i] = this.arrayValues[i];
        }

        for (int i = index+1; i < newArrayKeys.length; i++) {
            newArrayKeys[i] = this.arrayKeys[i];
            newArrayValues[i] = this.arrayValues[i];
        }

        this.arrayKeys = newArrayKeys;
        this.arrayValues = newArrayValues;

    }
}
