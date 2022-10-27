package ex1;

import commun.Client;
import commun.Produit;

public class CompteAvecSeuil extends Compte {

    int seuil;

    int nombreDeLocation;

    public CompteAvecSeuil(Client client){
        super(client);
        this.seuil = 2;
        this.nombreDeLocation = 0;
    }

    public CompteAvecSeuil(Client client, int seuil) {
        super(client);
        this.seuil = seuil;
        this.nombreDeLocation = 0;
    }

    public double prixLocation(Produit p){
        if(nombreDeLocation < seuil){
            nombreDeLocation++;
            return p.getPrix();
        }
        else{
            nombreDeLocation = 0;
            return 0;
        }
    }
}
