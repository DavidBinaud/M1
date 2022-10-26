#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <pthread.h>
#include <netdb.h>
#include <stdlib.h>
#include<arpa/inet.h>
#include<string.h>
#include "common.h"
#include "node_interconnexions.h"

void *listenThread (void * par){
    fd_set set, settmp;
    struct paramsAcq * param = (struct paramsAcq *) par;
    int *lesAutresNoeuds = (int *)param->lesAutresNoeuds;
    int max = lesAutresNoeuds[0];

    int *rep_attendues = (int *)param->rep_attendues;
    int *horloge = (int *)param->horloge;
    int *demandeur = (int *)param->demandeur;
    int *differe = (int *)param->differe;
    int *heure_demande = (int *)param->heure_demande;
    pthread_cond_t *rep_attendues_cond = (pthread_cond_t *)param->rep_attendues_cond;

    //On remets le set à 0
    FD_ZERO(&set);

    //On ajoute les sockets des autres noeuds dans le set
    //On met à jour le descripteur max si besoin
    for(int i=0;i < taille_reseau;i++){
        FD_SET(lesAutresNoeuds[i], &set);
        if(lesAutresNoeuds[i] > max){
            max = lesAutresNoeuds[i];
        }
    }

    while(1) {
        settmp = set;
        int ready = select(max+1, &settmp, NULL, NULL, NULL);
        if(ready == -1){
            perror("select");
            exit(1);
        }
        for(int df; df <= max; df++){
            if(FD_ISSET(df, &settmp)) {
                struct message msg;
                int nb = recv_data(df, &msg, sizeof(struct message));
                if (nb == -1) {
                    perror("recv_data");
                    exit(1);
                }

                if(msg.etiquette == REQUEST){
                    printf("Reception d'une requete de la part de %d avec l'horloge %d \n", df, msg.horloge);
                    *horloge = *horloge > msg.horloge ? *horloge : msg.horloge;
                    if(*demandeur == 0 || *heure_demande > msg.horloge){
                        *horloge = msg.horloge;
                        struct message msg;
                        msg.etiquette = REPLY;
                        msg.horloge = *horloge;
                        int nb = send_data(df, &msg, sizeof(struct message));
                        if (nb == -1) {
                            perror("send_data");
                            exit(1);
                        }
                    } else {
                        differe[df] = 1;
                    }
                }else{
                    printf("Reception d'une reponse de la part de %d avec l'horloge %d \n", df, msg.horloge);
                    rep_attendues--;
                    if(rep_attendues == 0){
                        pthread_cond_broadcast(&rep_attendues_cond);
                    }
                }
            }
        }
    }
    pthread_exit(NULL);
}

int closeSockets(int * sockets){
    for(int i=0;i<taille_reseau;i++){
        if(close(sockets[i]) == -1){
            perror("close");
            return -1;
        }
    }
    return 0;
}


//Utiliser un short pour les étiquettes
int main(int argc, char *argv[]) {

    int indice = atoi(argv[3]);

    // cet appel construit le réseau complet
    int *lesAutresNoeuds = configuration(argc, argv);
    printf("Configuration réussie\n");
    printf("taille réseau: %d\n", taille_reseau);

    int demandeur = 0;
    int horloge = 0;
    //create an array of n elements without malloc
    int differe[taille_reseau];



    // algo exclusion mutuelle :
    //Variable conditionnelle
    pthread_cond_t rep_attendues_cond;
    if (pthread_cond_init(&rep_attendues_cond, NULL) != 0) {
        //Erreur de mise en place de la variable conditionnelle
        perror("cond");
        closeSockets(lesAutresNoeuds);
        exit(1);
    }

    pthread_mutex_t rep_attendues_mutex;
    if (pthread_mutex_init(&rep_attendues_mutex, NULL) != 0) {
        //Erreur de mise en place du mutex
        perror("mutex");
        pthread_cond_destroy(&rep_attendues_cond);
        pthread_mutex_destroy(&rep_attendues_mutex);
        closeSockets(lesAutresNoeuds);
        exit(1);
    }

    int rep_attendues;
    int heure_demande;

    struct paramsAcq params;
    params.lesAutresNoeuds = lesAutresNoeuds;
    params.rep_attendues = &rep_attendues;
    params.demandeur = &demandeur;
    params.horloge = &horloge;
    params.differe = differe;
    params.heure_demande = &heure_demande;
    params.rep_attendues_cond = &rep_attendues_cond;

    //Threads
    pthread_t thread_communication;
    if(pthread_create(&thread_communication,NULL, listenThread, &params) != 0){
        //Erreur lors de la création du thread
        perror("pthread");
        pthread_cond_destroy(&rep_attendues_cond);
        pthread_mutex_destroy(&rep_attendues_mutex);
        closeSockets(lesAutresNoeuds);
        exit(1);
    }

    //Boucle infinie
    while (1) {
        //Travail hors section critique
        travail_hors_ou_dans_section_critique(2);

        //Section critique
        //Demande d'accès
        demandeur = 1;
        horloge++;
        heure_demande = horloge;
        rep_attendues = taille_reseau - 1;
        //Envoi de la demande
        for (int i = 0; i < taille_reseau; i++) {
            if (i != indice) {
                char buffer[100];
                sprintf(buffer, "demande %d %d", indice, horloge);
                struct message msg;
                msg.etiquette = REQUEST;
                msg.horloge = heure_demande;

                int nb = send_data(lesAutresNoeuds[i], &msg, sizeof (struct message));
                if (nb == -1) {
                    perror("send_data");
                    closeSockets(lesAutresNoeuds);
                    exit(1);
                }
            }
        }

        //Attente de la réponse
        pthread_cond_wait(&rep_attendues_cond, &rep_attendues_mutex);

        travail_hors_ou_dans_section_critique(8);

        //Fin de la section critique
        demandeur = 0;
        for (int i = 0; i < taille_reseau; i++) {
            if (i != indice && differe[i] > 0) {
                printf("Envoi de la libération à %d\n", i);
                struct message msg;
                msg.etiquette = REPLY;
                msg.horloge = 0;

                int nb = send_data(lesAutresNoeuds[i], &msg, sizeof (struct message));
                differe[i] = 0;

                if (nb == -1) {
                    perror("send_data");
                    closeSockets(lesAutresNoeuds);
                    exit(1);
                }
            }
        }


    }

    pthread_join(thread_communication, NULL);
    if (pthread_mutex_destroy(&rep_attendues_mutex) != 0) {
        //Erreur de destruction du mutex
    }
    if (pthread_cond_destroy(&rep_attendues_cond) != 0) {
        //Erreur de destruction de la variable conditionnelle
    }
    closeSockets(lesAutresNoeuds);

    return 0;
}


