package ex2.decoratorProduit;

public class ProduitSolde extends Produit{

    private Produit produit;

    public ProduitSolde(Produit produit) {
        super(produit.getNom(), produit.prix);
        this.produit = produit;
    }

    @Override
    public double getPrix() {
        return produit.getPrix() * 0.9;
    }

}
