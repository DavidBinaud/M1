package ex2.decoratorCompte;

import commun.Produit;

public class Forfait extends Compte {

    protected Compte compteDecore;

    public Forfait(Compte compteDecore) {
        super(compteDecore.client);
        this.compteDecore = compteDecore;
    }

    public double prixLocation(Produit p){
        return this.compteDecore.prixLocation(p);
    }
}
