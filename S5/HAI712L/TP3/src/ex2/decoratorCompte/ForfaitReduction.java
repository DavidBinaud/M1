package ex2.decoratorCompte;

import commun.Produit;

public class ForfaitReduction extends Forfait{

    public ForfaitReduction(Compte compteDecore) {
        super(compteDecore);
    }

    public double prixLocation(Produit p){
        return super.prixLocation(p) * 0.9;
    }
}
