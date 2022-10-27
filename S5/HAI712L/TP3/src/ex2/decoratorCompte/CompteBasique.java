package ex2.decoratorCompte;

import commun.Client;
import commun.Produit;

public class CompteBasique extends Compte{

        public CompteBasique(Client client) {
            super(client);
        }

        public double prixLocation(Produit p){
            return p.getPrix();
        }
}
