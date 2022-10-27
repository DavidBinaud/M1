package ex2.decoratorCompte;

import commun.Client;
import commun.Produit;

public abstract class Compte {

    protected Client client;

    public Compte(Client client) {
        this.client = client;
    }

    public abstract double prixLocation(Produit p);
}
