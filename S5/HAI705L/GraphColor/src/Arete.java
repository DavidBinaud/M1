public class Arete {

    private Sommet sommet1;
    private Sommet sommet2;

    public Arete(Sommet sommet1, Sommet sommet2) {
        this.sommet1 = sommet1;
        this.sommet2 = sommet2;
    }

    public Sommet getSommet1() {
        return sommet1;
    }

    public void setSommet1(Sommet sommet1) {
        this.sommet1 = sommet1;
    }

    public Sommet getSommet2() {
        return sommet2;
    }

    public void setSommet2(Sommet sommet2) {
        this.sommet2 = sommet2;
    }

    @Override
    public String toString() {
        return "Arete{" +
                "sommet1=" + sommet1 +
                ", sommet2=" + sommet2 +
                '}';
    }

    //permet de savoir si une arete est égale à une autre
    public boolean equals(Arete arete) {
        return (this.sommet1.equals(arete.getSommet1()) && this.sommet2.equals(arete.getSommet2())) || (this.sommet1.equals(arete.getSommet2()) && this.sommet2.equals(arete.getSommet1()));
    }

    //permet de savoir si un sommet est contenu dans une arete
    public boolean contientSommet(Sommet sommet) {
        return this.sommet1.equals(sommet) || this.sommet2.equals(sommet);
    }

    //permet de retourner le sommet de l'arete qui n'est pas celui passé en paramètre
    public Sommet getSommetAutreQue(Sommet sommet) {
        if (this.sommet1.equals(sommet)) {
            return this.sommet2;
        }
        return this.sommet1;
    }
}
