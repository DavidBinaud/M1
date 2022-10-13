import java.util.Arrays;

public class FastDictionary extends AbstractDictionary{

    public FastDictionary() {
        this.arrayKeys = new Object[4];
        this.arrayValues = new Object[4];
    }

    @Override
    public int indexOf(Object key) {
        int hashCode = Math.abs(key.hashCode());
        int index = hashCode  % arrayKeys.length;
        int i = index;

        if(this.arrayKeys[i] != null && this.arrayKeys[i].equals(key)) return i;
        //Il faut utiliser un do while pour passer sur tout le tableau
        do {
            i = (i+1) % arrayKeys.length;
            if(arrayKeys[i] != null && arrayKeys[i].equals(key)) return i;
        }while (i != index);

        return -1;
    }

    @Override
    public int newIndexOf(Object key) {
        if(mustGrow()) grow();

        //Abs pour negatif
        int hashcode = Math.abs(key.hashCode());
        int newIndex = hashcode % arrayKeys.length;

        if(this.arrayKeys[newIndex] == null) return newIndex;

        do{
            newIndex = (newIndex+1) % arrayKeys.length;
        }while(arrayKeys[newIndex] != null);

        return newIndex;
    }

    @Override
    public int size() {
        int size = 0;
        for (int i = 0; i < arrayKeys.length; i++) {
            if(arrayKeys[i] != null) size++;
        }
        return size;
    }

    public boolean mustGrow(){
        return this.size() > this.arrayKeys.length * (3/4);
    }

    /*
        Grow va modifier la place des éléments par rapport à leur place avant d'agrandir
     */
    public void grow(){
        int newLength = (int)Math.ceil(this.arrayKeys.length * (5/4));

        Object[] oldKeyArray = this.arrayKeys;
        Object[] oldValueArray = this.arrayValues;

        this.arrayKeys = new Object[newLength];
        this.arrayValues = new Object[newLength];

        for (int i = 0; i < oldKeyArray.length; i++) {
            if(oldKeyArray[i] != null){
                this.put(oldKeyArray[i], oldValueArray[i]);
/*                int indexToInsert = this.newIndexOf(oldKeyArray[i]);
                this.arrayKeys[indexToInsert] = oldKeyArray[i];
                this.arrayValues[indexToInsert] = oldValueArray[i];*/
            }
        }
    }
}
