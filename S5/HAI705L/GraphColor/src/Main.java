public class Main {
    public static void main(String[] args) {
        Sommet v = new Sommet("v");
        Sommet y = new Sommet("y");
        Sommet z = new Sommet("z");
        Sommet t = new Sommet("t");
        Sommet u = new Sommet("u");
        Sommet x = new Sommet("x");

        Arete v_x = new Arete(v, x);
        Arete v_z = new Arete(v, z);
        Arete v_t = new Arete(v, t);
        Arete y_x = new Arete(y, x);
        Arete y_u = new Arete(y, u);
        Arete y_t = new Arete(y, t);
        Arete x_u = new Arete(x, u);

        Graph graph = new Graph();
        graph.ajouterSommet(v);
        graph.ajouterSommet(y);
        graph.ajouterSommet(z);
        graph.ajouterSommet(t);
        graph.ajouterSommet(u);
        graph.ajouterSommet(x);

        graph.ajouterArete(v_x);
        graph.ajouterArete(v_z);
        graph.ajouterArete(v_t);
        graph.ajouterArete(y_x);
        graph.ajouterArete(y_u);
        graph.ajouterArete(y_t);
        graph.ajouterArete(x_u);

        graph.afficher();
        graph.calculerDegres();
        graph.afficher();
        graph.getSommetDegMax().afficher();

        System.out.println(graph.estColorableRec(4));
        System.out.println(graph.estColorableRec(3));
        System.out.println(graph.estColorableRec(2));
        System.out.println(graph.estColorableRec(1));
    }
}
