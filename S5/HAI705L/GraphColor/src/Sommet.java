public class Sommet {

    private String nom;

    private int couleur;

    private int degre;


    public Sommet(String nom, int couleur, int degre) {
        this.nom = nom;
        this.couleur = couleur;
        this.degre = degre;
    }

    public Sommet(String nom, int couleur) {
        this(nom, couleur, 0);
    }

    public Sommet(String nom) {
        this(nom, 0, 0);
    }


    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getCouleur() {
        return couleur;
    }

    public void setCouleur(int couleur) {
        this.couleur = couleur;
    }

    public int getDegre() {
        return degre;
    }

    public void setDegre(int degre) {
        this.degre = degre;
    }

    public void incrementerDegre() {
        this.degre++;
    }

    public void decrementerDegre() {
        this.degre--;
    }

    @Override
    public String toString() {
        return "Sommet : " + this.nom + " Couleur : " + this.couleur + " Degre : " + this.degre;
    }

    public void afficher() {
        System.out.println(this.toString());
    }
}
