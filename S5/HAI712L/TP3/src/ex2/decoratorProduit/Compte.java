package ex2.decoratorProduit;

import commun.Client;

public abstract class Compte {

    protected Client client;

    public Compte(Client client) {
        this.client = client;
    }

    public abstract double prixLocation(Produit p);
}
