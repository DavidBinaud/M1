# TD/TP 1 - mise en place d'un anneau

## Questions

### Question 1.

Pour qu'un processus connaisse ses voisins, on va utiliser un serveur centralisé qui qui va se charger de mettre en place l'anneau. Chaque processus va entrer en contact avec le serveur central.

### Question 2.

Sachant que chaque l'anneau est construit et que chaque processus doit être similaire et qu'aucun ne peut être initiateur unique de l'algorithme.
Chaque processus va envoyer son indice à son successeur.
Puis chaque processus  P va envoyer à son successeur S le message du prédécesseur Pr tant que ce message ne représente pas le contenu du premier message envoyé par P. Cad tant que P ne reçoit pas son indice, il transfère et incrémente.