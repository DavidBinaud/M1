package ex2.decoratorProduit;

public abstract class Produit {

    private String nom;

    protected double prix;

    public Produit(String nom, double prix) {
        this.nom = nom;
        this.prix = prix;
    }

    public abstract double getPrix();

    public String getNom(){
        return nom;
    }
}
