package commun;

public class Produit {

    private String nom;

    private double prix;

    public Produit(String nom, double prix) {
        this.nom = nom;
        this.prix = prix;
    }

    public double getPrix(){
        return prix;
    }
}
