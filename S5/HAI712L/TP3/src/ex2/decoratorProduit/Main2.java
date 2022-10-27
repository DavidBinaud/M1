package ex2.decoratorProduit;

import commun.Client;

public class Main2 {
    public static void main(String[] args) {
        Client cl = new Client("Dupont");
        Compte cmt = new CompteBasique(cl);

        Produit lgv = new ProduitBasique("La grande vadrouille", 10.0);
        System.out.println("basique lgv : " + cmt.prixLocation(lgv));
        Produit lgvSolde = new ProduitSolde(lgv);
        System.out.println("basique lgvSolde : " + cmt.prixLocation(lgvSolde));
        Produit lgvTaxe = new ProduitTaxe(lgv);
        System.out.println("basique lgvTaxe : " + cmt.prixLocation(lgvTaxe));
        Produit lgvSoldeTaxe = new ProduitTaxe(lgvSolde);
        System.out.println("basique lgvSoldeTaxe : " + cmt.prixLocation(lgvSoldeTaxe));
    }
}
