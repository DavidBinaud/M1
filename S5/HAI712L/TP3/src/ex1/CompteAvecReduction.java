package ex1;

import commun.Client;
import commun.Produit;

public class CompteAvecReduction extends Compte {

    private double reduction;

    public CompteAvecReduction(Client client, double reduction) {
        super(client);
        this.reduction = reduction;
    }

    public double prixLocation(Produit p){
        return p.getPrix() * (1 - reduction);
    }
}
