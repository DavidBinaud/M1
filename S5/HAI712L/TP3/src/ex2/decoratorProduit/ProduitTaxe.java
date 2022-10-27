package ex2.decoratorProduit;

public class ProduitTaxe extends Produit{

    private Produit produit;

    public ProduitTaxe(Produit produit) {
        super(produit.getNom(), produit.prix);
        this.produit = produit;
    }

    @Override
    public double getPrix() {
        return produit.getPrix() * 1.15;
    }

}
