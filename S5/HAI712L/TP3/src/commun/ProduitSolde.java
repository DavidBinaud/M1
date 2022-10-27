package commun;

public class ProduitSolde extends Produit{

        public ProduitSolde(String nom, double prix) {
            super(nom, prix);
        }

        public double getPrix(){
            return super.getPrix() * 0.5;
        }

}
