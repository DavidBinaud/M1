package ex1;

import commun.Client;
import commun.Produit;
import commun.ProduitSolde;

public class Main {
    public static void main(String[] args) {
        Produit lgv = new Produit("La Grande Vadrouille", 10.0);
        ProduitSolde lgvSolde = new ProduitSolde("La Grande Vadrouille", 10.0);
        Produit aolc = new Produit("Aile ou la Cuisse", 5.0);
        Client cl = new Client("Dupont");
        Compte cmt = new Compte(cl);
        CompteAvecReduction cmtr = new CompteAvecReduction(cl, 0.1);
        CompteAvecSeuil cmts = new CompteAvecSeuil(cl, 2);

        System.out.println("ex1.Compte normal:");
        System.out.println("\tproduit normal:" + cmt.prixLocation(lgv));
        System.out.println("\tproduit soldé:" + cmt.prixLocation(lgvSolde));

        System.out.println("\nex1.Compte avec réduction de 10%:");
        System.out.println("\tproduit normal:" + cmtr.prixLocation(lgv));
        System.out.println("\tproduit soldé:" + cmtr.prixLocation(lgvSolde));

        System.out.println("\nex1.Compte avec seuil = 2");
        System.out.println(cmts.prixLocation(lgv));
        System.out.println(cmts.prixLocation(lgvSolde));
        System.out.println(cmts.prixLocation(aolc));
        System.out.println(cmts.prixLocation(aolc));
    }
}