package ex1;

import commun.Client;
import commun.Produit;

public class Compte {

    private Client client;

    public Compte(Client client) {
        this.client = client;
    }

    public double prixLocation(Produit p){
        return p.getPrix();
    }
}
