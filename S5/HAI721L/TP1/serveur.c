#include <stdio.h>
#include <sys/types.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

// Rôle du serveur : accepter la demande de connexion d'un client,
// recevoir une chaîne de caractères, afficher cette chaîne et
// renvoyer au client le nombre d'octets reçus par le serveur.

int main(int argc, char *argv[])
{
  // je passe en paramètre un numero de port pour la socket et le nombre de processus
  // d'écoute. Je teste donc le passage de paramètres
  
  if (argc<3){
    printf("utilisation: %s numero_port nombre_de_processus\n", argv[0]);
    exit(1);
  }
  
  /* Etape 1 : créer une socket (la socket qui permettra de recevoir
     les demandes de connexion.*/
 
  int ds = socket(PF_INET, SOCK_DGRAM, 0);
  /* /!\ : Il est indispensable de tester les valeurs de retour de
     toutes les fonctions et agir en fonction des valeurs possibles.*/
  if (ds == -1){
    perror("Serveur : probleme creation socket");
    exit(1); // je choisis ici d'arrêter le programme car le reste
	     // dépendent de la réussite de la création de la socket.
  }


  printf("Serveur: creation de la socket : ok\n");

  
  /* Etape 2 : nommer la socket. Elle aura une ou des IP de la machine
     sur laquelle le programme sera exécuté et le numéro de port passé
     en paramètre*/

  
  struct sockaddr_in server;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = INADDR_ANY;
  server.sin_port = htons(atoi(argv[1]));
  
  if(bind(ds, (struct sockaddr*)&server, sizeof(server)) < 0){
    perror("Serveur : erreur bind");
    close(ds); // je libère les ressources avant de terminer.
    exit(1); // je choisis de quitter le programme : la suite dépend de la réussite du nommage.
  }

  // je continue à alimenter le programme avec traces d'exécution
  printf("Serveur: nommage : ok\n");

  printf("Serveur : j'attend un message d'un client \n");
  

  // Je peux tester l'exécution de cette étape avant de passer à la suite.

  /* Etape 3 : réception d'un message de type chaîne de caractères */
  int numberOfProcess = 0;
  int numberOfProcessMax = atoi(argv[2]);

  struct sockaddr_in sockaddrInOfAllProcess[numberOfProcessMax];
  while(numberOfProcess < numberOfProcessMax) {
      struct sockaddr_in sockaddrInClient ; // pour obtenir l'adresse du client accepté.
      socklen_t lgCv = sizeof (struct sockaddr_in);

      char buffer[50];
      /* attendre un message dont la taille maximale est 500 octets. Pour
         cet exercice, il est demandé de ne faire qu'un seul appel à recv
         pour recevoir un message. */
      int rcv = recvfrom(ds, buffer, sizeof(buffer) - 1, 0, (struct sockaddr *) &sockaddrInClient, &lgCv);

      /* Traiter TOUTES les valeurs de retour (voir le cours ou la documentation). */
      if (rcv == -1) {
          perror("Serveur, probleme recv :");
          //        close(dsCv);
          close(ds);
          exit(1);
      } else if (rcv == 0) {
          perror("Serveur, probleme socket fermée :");
          //        close(dsCv);
          close(ds);
          exit(1);
      }
      buffer[rcv] = '\0';


      char* token = strtok(buffer , "-");
      char* indiceOfProcess = token;
      token = strtok(NULL, "-");
      char* port = token;


      int indice = atoi(indiceOfProcess);
      sockaddrInOfAllProcess[indice] = sockaddrInClient;

      printf("Server: Client %s sur le port %s\n", indiceOfProcess, port);

      printf("On a séparé la chaine de caractères\n");
      /* Afficher le nombre d'octets EFFECTIVEMENT reçus. : /!\ Faire la
         différence entre le nombre d'octets qu'on demande à extraire
         depuis le buffer de réception d'une socket et le nombre d'octets
         qu'on a effectivement réussi à extraire.*/
      char address[INET_ADDRSTRLEN];
      inet_ntop(AF_INET, &sockaddrInClient.sin_addr, address, INET_ADDRSTRLEN);
      printf("Serveur : contenu du message : %s \n\n", buffer);
      numberOfProcess++;
  }

    printf("Liste des structures des processus:\n");
    for (int i = 0; i < numberOfProcessMax; ++i) {
        char address[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &sockaddrInOfAllProcess[i].sin_addr, address, INET_ADDRSTRLEN);
        printf("%d:%s ", i, address);
    }
    printf("\n");
    
  /* Etape 7 : fermeture de la socket du client */ 
  printf("Serveur : fin du dialogue avec le client\n");
  close (ds);
  printf("Serveur : je termine\n");
}








