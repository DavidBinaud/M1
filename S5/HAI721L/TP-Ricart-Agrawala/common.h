
#include <stdlib.h>

// cette fonction simule des calculs d'une durée de sec secondes

void travail_hors_ou_dans_section_critique(int sec);
// envoi d'un message en TCP
int send_data(int socket, void *buffer, size_t length);

// la meme fonction, en ajoutant un compteur du nombre d'appels à send effectué pour l'envoi du message
int send_data_bis(int socket, void *buffer, size_t length, int * nbCallSend);
// reception d'un message en TCP
int recv_data(int socket, void *buffer, size_t length);


//label pour les messages
typedef enum {
    REQUEST=0,
    REPLY=1,
} label;

struct message{
    label etiquette;
    int horloge;
};

struct paramsAcq{
    int * lesAutresNoeuds;
    int * rep_attendues;
    int * horloge;
    int * demandeur;
    int * differe;
    int * heure_demande;
    pthread_cond_t * rep_attendues_cond;
};