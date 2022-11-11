import java.util.ArrayList;

public class Graph {
    private ArrayList<Sommet> sommets;
    private ArrayList<Arete> aretes;

    public Graph() {
        this.sommets = new ArrayList<>();
        this.aretes = new ArrayList<>();
    }

    public Graph(ArrayList<Sommet> sommets, ArrayList<Arete> aretes) {
        this.sommets = sommets;
        this.aretes = aretes;
        this.calculerDegres();
    }

    public void ajouterSommet(Sommet sommet) {
        this.sommets.add(sommet);
    }

    public void ajouterArete(Arete arete) {
        this.aretes.add(arete);
    }

    public ArrayList<Sommet> getSommets() {
        return sommets;
    }

    public void setSommets(ArrayList<Sommet> sommets) {
        this.sommets = sommets;
    }

    public ArrayList<Arete> getAretes() {
        return aretes;
    }

    public void setAretes(ArrayList<Arete> aretes) {
        this.aretes = aretes;
    }

    public void afficherSommets() {
        for (Sommet sommet : this.sommets) {
            System.out.println(sommet);
        }
    }

    public void afficherAretes() {
        for (Arete arete : this.aretes) {
            System.out.println(arete);
        }
    }

    public void calculerDegres() {
        for (Sommet sommet : this.sommets) {
            sommet.setDegre(0);
        }
        for (Arete arete : this.aretes) {
            arete.getSommet1().incrementerDegre();
            arete.getSommet2().incrementerDegre();
        }
    }

    public void afficher() {
        this.afficherSommets();
        this.afficherAretes();
    }

    public void afficherSommetsEtAretes() {
        for (Sommet sommet : this.sommets) {
            System.out.println(sommet);
            for (Arete arete : this.aretes) {
                if (arete.contientSommet(sommet)) {
                    System.out.println(arete);
                }
            }
        }
    }

    public Sommet getSommetDegMax(){
        return this.sommets.stream().max((s1, s2) -> s1.getDegre() - s2.getDegre()).get();
    }

    public int getDegreMax(){
        return this.getSommetDegMax().getDegre();
    }

    public Sommet getSommetTrivialementColorable(int k){
        for (Sommet sommet : this.sommets) {
            if(sommet.getDegre() < k){
                return sommet;
            }
        }
        return null;
    }

    public boolean estColorable(int k){
        return this.getSommetTrivialementColorable(k) != null;
    }

    public Graph getGraphPriveDeSommet(Sommet sommet){
        ArrayList<Sommet> sommets = new ArrayList<>();
        ArrayList<Arete> aretes = new ArrayList<>();
        for (Sommet s : this.sommets) {
            if(!s.equals(sommet)){
                sommets.add(s);
            }
        }
        for (Arete arete : this.aretes) {
            if(!arete.contientSommet(sommet)){
                aretes.add(arete);
            }
        }
        return new Graph(sommets, aretes);
    }

    public boolean estColorableRec(int k){
        if(this.estColorable(k)){
            Sommet sommet = this.getSommetTrivialementColorable(k);
            Graph graph = this.getGraphPriveDeSommet(sommet);
            return graph.estColorableRec(k);
        } else if(this.sommets.size() == 0){
            return true;
        } else {
            return false;
        }
    }
}
