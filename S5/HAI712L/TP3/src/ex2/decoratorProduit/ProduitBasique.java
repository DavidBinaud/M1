package ex2.decoratorProduit;

public class ProduitBasique extends Produit{

    public ProduitBasique(String nom, double prix) {
        super(nom, prix);
    }

    @Override
    public double getPrix() {
        return prix;
    }

}
