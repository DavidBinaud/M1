public interface IDictionnary {

    /* rend la valeur associée à key dans le receveur */
    Object get(Object key);

    /* entre une nouveau couple clé-valeur dans le receveur, rend le receveur. */
    IDictionnary put(Object key, Object value);

    /* rend vrai si le receveur est vide, faux sinon */
    boolean isEmpty();

    /* rend vrai si la cl´e est connue dans le receveur, faux sinon. */
    boolean containsKey(Object key);

    /* rend le nombre d’éléments (donc le nombre de couples clé-valeur) contenus dans le receveur. */
    int size();


}
