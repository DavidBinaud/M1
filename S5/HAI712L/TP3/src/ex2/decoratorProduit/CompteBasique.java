package ex2.decoratorProduit;

import commun.Client;

public class CompteBasique extends Compte {

        public CompteBasique(Client client) {
            super(client);
        }

        public double prixLocation(Produit p){
            return p.getPrix();
        }
}
