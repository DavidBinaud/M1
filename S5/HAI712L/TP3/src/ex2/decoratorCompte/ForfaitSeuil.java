package ex2.decoratorCompte;

import commun.Produit;

public class ForfaitSeuil extends Forfait {

    int seuil;

    int nombreDeLocation;

    public ForfaitSeuil(Compte compteDecore) {
        super(compteDecore);
        this.seuil = 2;
        this.nombreDeLocation = 0;
    }

    public double prixLocation(Produit p){
        if(nombreDeLocation < seuil){
            nombreDeLocation++;
            return super.prixLocation(p);
        }
        else{
            nombreDeLocation = 0;
            return 0;
        }
    }
}
