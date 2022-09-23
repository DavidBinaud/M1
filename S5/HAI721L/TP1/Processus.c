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

  if (argc != 4){
    printf("utilisation : %s ip_serveur port_serveur indice\n", argv[0]);
    exit(0);
  }
  char *indice = argv[3];

  /* Etape 1 : créer une socket */   
  int ds = socket(PF_INET, SOCK_STREAM, 0);

  /* /!\ : Il est indispensable de tester les valeurs de retour de
     toutes les fonctions et agir en fonction des valeurs possibles.*/
  if (ds == -1){
    printf("Client : pb creation socket\n");
    exit(1); // je choisis ici d'arrêter le programme car le reste
	     // dépendent de la réussite de la création de la socket.
  }
  
  /* J'alimente le programme avec des traces d'exécution pour observer ce
     qui se produit à l'exécution et pour mieux localiser les erreurs. */
  printf("Client: creation de la socket : ok\n");
  
  // Je peux déjà tester l'exécution de cette étape avant de passer à la suite.
  
  /* Etape 2 : designer la socket du serveur : avoir une structure qui
     contient l'adresse de cette socket (IP + numéro de port. */
  struct sockaddr_in adrServ;
  int res = inet_pton(AF_INET, argv[1], &(adrServ.sin_addr));
  if(res == -1){
    printf("Client: problème d'adresse ip\n");
    exit(1);
  }

  adrServ.sin_family = AF_INET;
  adrServ.sin_port = htons(atoi(argv[2]));
    
  int lgAdr = sizeof(struct sockaddr_in);
    
  /* Etape 3 : envoyer une demande de connexion au serveur.*/
  int conn = connect(ds, (struct sockaddr *)&adrServ, lgAdr);

  // je traite les valeurs de retour
  if (conn <0){
    perror ("Client: pb au connect :");
    close (ds); // je libère les ressources avant de terminer.
    exit (1); // je choisi de quitter le programme : la suite dépend
	      // de la réussite de l'envoi de la demande de connexion.
  }
    // je continue à alimenter le programme avec traces d'exécution
    printf("Client : demande de connexion au serveur reussie \n");

    /* j'envoie mon indice au serveur */
    int snd = send(ds, &indice, strlen(indice)+1, 0);
    if(snd < 1){
        perror ("Client: pb au send indice :");
        close (ds); // je libère les ressources avant de terminer.
        exit (1); // je choisi de quitter le programme : la suite dépend
    }
    /* il me dit si j'ai la priorité de connexion - le serveur va élire un seul processus comme prioritaire */
    char priority[1];
    char address[200];
    int rcv = recv (ds, priority, 1, 0) ;

    /* Traiter TOUTES les valeurs de retour (voir le cours ou la documentation). */
    if(rcv == -1){
        perror ( "Client, probleme recv priority:");
        close(ds);
        exit(1);
    } else if (rcv == 0){
        perror ( "Client, probleme socket fermée :");
        close(ds);
        exit(1);
    }
    /* il me renvoie l'adresse du Processus après moi */
    rcv = recv (ds, address, 200, 0) ;
    if(rcv == -1){
        perror ( "Client, probleme recv address:");
        close(ds);
        exit(1);
    } else if (rcv == 0){
        perror ( "Client, probleme socket fermée :");
        close(ds);
        exit(1);
    }

    /* On ferme la socket avec le serveur car on a les infos nécessaires */
    close(ds);





  // Je peux tester l'exécution de cette étape avant de passer à la suite.
  
  /* Etape 4 : Lire le message du serveur qui nous indique notre indice */

    /* Etape 1 : créer une socket pour communiquer avec mon successeur*/
    int dsOut = socket(PF_INET, SOCK_STREAM, 0);

    /* Je mets en place une socket d'écoute */
    int dsListen = socket(PF_INET, SOCK_STREAM, 0);
    struct sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(atoi(argv[1]));

    if(bind(ds, (struct sockaddr*)&server, sizeof(server)) < 0){
        perror("Serveur : erreur bind");
        close(ds); // je libère les ressources avant de terminer.
        close(dsListen); // je libère les ressources avant de terminer.
        exit(1); // je choisis de quitter le programme : la suite dépend de la réussite du nommage.
    }

    if(strcmp(priority, "1")){
        struct sockaddr_in adrSucc;
        res = inet_pton(AF_INET, address, &(adrSucc.sin_addr));
        if(res == -1){
            printf("Client: problème d'adresse ip\n");
            exit(1);
        }

        adrSucc.sin_family = AF_INET;
        adrSucc.sin_port = htons(atoi(argv[2]));

        lgAdr = sizeof(struct sockaddr_in);

        /* Etape 3 : envoyer une demande de connexion au Successeur.*/
        int conn = connect(dsOut, (struct sockaddr *)&adrSucc, lgAdr);
    } else {

    }




  //strlen +1 car la fonction strlen ne compte pas le '\0'
  int snd = send(ds, m, strlen(m)+1, 0);
  /* Traiter TOUTES les valeurs de retour (voir le cours ou la documentation). */
  if(snd == -1){
      perror ("Client: pb au send :");
      close(ds);
      exit(1);
  }

  close (ds);
  printf("Client : je termine\n");
}
