#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdlib.h>
#include<arpa/inet.h>
#include<string.h>

/* Rôle du client : envoyer une demande de connexion à un serveur,
   envoyer une chaîne de caractères à ce serveur (la chaîne de
   caractère est à saisir au clavier), recevoir un entier et comparer
   cet entier avec le nombre d'octets envoyés. L'idée est de mettre en
   place les bases qui vous permettront par la suite une mise en
   oeuvre correcte des communications en TCP et de vérifier les
   échanges effectués */

int main(int argc, char *argv[]) {

    /* je passe en paramètre l'adresse de la socket d'écoute du serveur
       (IP et numéro de port). Je teste donc le passage de parametres */

    if (argc != 4) {
        printf("utilisation : %s ip_serveur port_serveur indice\n", argv[0]);
        exit(0);
    }
    char *indice = argv[3];

    /* Etape 1 : créer une socket */
    int ds = socket(PF_INET, SOCK_DGRAM, 0);

    /* /!\ : Il est indispensable de tester les valeurs de retour de
       toutes les fonctions et agir en fonction des valeurs possibles.*/
    if (ds == -1) {
        printf("Client : pb creation socket\n");
        exit(1); // je choisis ici d'arrêter le programme car le reste
        // dépendent de la réussite de la création de la socket.
    }


    printf("Client: creation de la socket : ok\n");


    /* Etape 2 : designer la socket du serveur : avoir une structure qui
       contient l'adresse de cette socket (IP + numéro de port. */
    struct sockaddr_in adrServ;
    int res = inet_pton(AF_INET, argv[1], &(adrServ.sin_addr));
    if (res == -1) {
        printf("Client: problème d'adresse ip\n");
        exit(1);
    }

    adrServ.sin_family = AF_INET;
    adrServ.sin_port = htons(atoi(argv[2]));

    int lgAdr = sizeof(struct sockaddr_in);


    printf("indice fait %d octets\n", strlen(indice));
    char* indiceAndPort = indice;
    strcat(indiceAndPort, "-");
    //
    strcat(indiceAndPort, argv[2]);
    printf("indice et port: %s\n", indiceAndPort);
    /* j'envoie mon indice au serveur */
    int snd = sendto(ds, indiceAndPort, strlen(indiceAndPort), 0, (const struct sockaddr *) &adrServ, lgAdr);
    if (snd < 1) {
        perror("Client: pb au send indice :");
        close(ds); // je libère les ressources avant de terminer.
        exit(1); // je choisi de quitter le programme : la suite dépend
    }
    printf("%d octets envoyés !\n", snd);
    printf("message envoyé: %s", indice);
    close(ds); // je libère les ressources avant de terminer.
    exit(1); // je choisi de quitter le programme : la suite dépend

    char address[200];
    /* il me renvoie l'adresse du Processus après moi */
    int rcv = recv(ds, address, 200, 0);
    if (rcv == -1) {
        perror("Client, probleme recv address:");
        close(ds);
        exit(1);
    } else if (rcv == 0) {
        perror("Client, probleme socket fermée :");
        close(ds);
        exit(1);
    }
    /* On ferme la socket avec le serveur car on a les infos nécessaires */
    close(ds);

    /* Je mets en place une socket d'écoute pour communiquer avec mon prédécesseur*/
    int dsPredecesseur = socket(PF_INET, SOCK_STREAM, 0);
    struct sockaddr_in sockaAddrInPredecesseur;
    sockaAddrInPredecesseur.sin_family = AF_INET;
    sockaAddrInPredecesseur.sin_addr.s_addr = INADDR_ANY;
    sockaAddrInPredecesseur.sin_port = htons(atoi(argv[1]) + 1);

    if (bind(dsPredecesseur, (struct sockaddr *) &sockaAddrInPredecesseur, sizeof(sockaAddrInPredecesseur)) < 0) {
        perror("Serveur : erreur bind");
        close(dsPredecesseur); // je libère les ressources avant de terminer.
        exit(1); // je choisis de quitter le programme : la suite dépend de la réussite du nommage.
    }

    int ecoute = listen(dsPredecesseur, 1);
    if (ecoute < 0) {
        printf("Serveur : je suis sourd(e)\n");
        close(dsPredecesseur);
        exit(1);
    }


    /* Etape 1 : créer une socket pour me connecter à mon successeur*/
    int dsSuccesseur = socket(PF_INET, SOCK_STREAM, 0);

    /* /!\ : Il est indispensable de tester les valeurs de retour de
       toutes les fonctions et agir en fonction des valeurs possibles.*/
    if (dsSuccesseur == -1) {
        printf("Client : pb creation socket\n");
        close(dsSuccesseur); // je libère les ressources avant de terminer.
        close(dsPredecesseur);
        exit(1); // je choisis ici d'arrêter le programme car le reste
        // dépendent de la réussite de la création de la socket.
    }
    /* Je me connecte à mon successeur */
    struct sockaddr_in sockAddrInSucesseur;
    res = inet_pton(AF_INET, address, &(sockAddrInSucesseur.sin_addr));
    if (res == -1) {
        printf("Client: problème d'adresse ip\n");
        close(dsSuccesseur); // je libère les ressources avant de terminer.
        close(dsPredecesseur);
        exit(1);
    }

    sockAddrInSucesseur.sin_family = AF_INET;
    sockAddrInSucesseur.sin_port = htons(atoi(argv[2]) + 1);

    lgAdr = sizeof(struct sockaddr_in);

    /* Etape 3 : envoyer une demande de connexion au Successeur.*/
    int conn = connect(dsSuccesseur, (struct sockaddr *) &sockAddrInSucesseur, lgAdr);
    if (conn < 0) {
        perror("Client: pb au connect vers Successeur:");
        close(dsSuccesseur); // je libère les ressources avant de terminer.
        close(dsPredecesseur);
        exit(1); // je choisi de quitter le programme : la suite dépend
        // de la réussite de l'envoi de la demande de connexion.
    }

    //accept


    //strlen +1 car la fonction strlen ne compte pas le '\0'
    snd = send(ds, indice, strlen(indice) + 1, 0);
    /* Traiter TOUTES les valeurs de retour (voir le cours ou la documentation). */
    if (snd == -1) {
        perror("Client: pb au send :");
        close(dsSuccesseur); // je libère les ressources avant de terminer.
        close(dsPredecesseur);
        exit(1);
    }

    char inMsg[20];
    int stillCounting = 1;
    int count = 1;
    while(stillCounting == 1){
        rcv = recv(ds, inMsg, 20, 0);
        if (rcv == -1) {
            perror("Client, probleme recv from Predecesseur:");
            close(dsSuccesseur); // je libère les ressources avant de terminer.
            close(dsPredecesseur);
            exit(1);
        } else if (rcv == 0) {
            perror("Client, probleme socket fermée :");
            close(dsSuccesseur); // je libère les ressources avant de terminer.
            close(dsPredecesseur);
            exit(1);
        }
        if(strcmp(indice, inMsg) == 0){
            stillCounting = 0;
        } else {
            count++;
            snd = send(ds, inMsg, strlen(inMsg) + 1, 0);
            /* Traiter TOUTES les valeurs de retour (voir le cours ou la documentation). */
            if (snd == -1) {
                perror("Client: pb au send :");
                close(dsSuccesseur); // je libère les ressources avant de terminer.
                close(dsPredecesseur);
                exit(1);
            }
        }
    }

    close(dsSuccesseur); // je libère les ressources avant de terminer.
    close(dsPredecesseur);
    printf("Processus : je termine\n");
    printf("Il y a %d processus", count);
}
