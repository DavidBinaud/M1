public class UtilisationDictionnaire {
    public static void main(String[] args) {
        IDictionnary dic = new OrderedDictionary();
        System.out.println("Le dictionnaire est-il vide? " + dic.isEmpty());

        System.out.println("On ajoute des valeurs dans le dictionnaire");
        int x = 15;
        for (int i = 0; i < x; i++) {
            dic.put("TestKey" + i, "TestValue" + i);
        }
        System.out.println("La taille du dictionnaire est: " + dic.size());

        System.out.println("Le dictionnaire contient la clé 'TestKey6'? " + dic.containsKey("TestKey6"));
        System.out.println("Le dictionnaire contient la clé 'TestKey20'? " + dic.containsKey("TestKey20"));

        System.out.println("La valeur de la clé 'TestKey6' est : '" + dic.get("TestKey6") + "'");
    }
}
