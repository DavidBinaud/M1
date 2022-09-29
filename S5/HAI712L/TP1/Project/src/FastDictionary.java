import java.util.Arrays;

public class FastDictionary extends AbstractDictionary{

    public FastDictionary() {
        this.arrayKeys = new Object[4];
        this.arrayValues = new Object[4];
    }

    @Override
    public int indexOf(Object key) {
        int hashCode = key.hashCode();
        int index = hashCode  % arrayKeys.length;
        while (arrayKeys[index] != key && index < arrayKeys.length){
            index++;
        }
        //On renvoi -1 si on a dépassé la fin du tableau, l'index sinon
        return index > arrayKeys.length ? -1 : index;
    }

    @Override
    public int newIndexOf(Object key) {
        if(mustGrow()) grow();
        int hashcode = key.hashCode();
        int newIndex = hashcode % arrayKeys.length;

        while(arrayKeys[newIndex] != null){
            if(newIndex >= arrayKeys.length) newIndex = newIndex % arrayKeys.length;
            else newIndex++;
        }

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

    public void grow(){
        int newLength = (int)Math.ceil(this.size() * (5/4));
        this.arrayKeys = Arrays.copyOf(arrayKeys, newLength);
        this.arrayValues = Arrays.copyOf(arrayValues, newLength);
    }
}
