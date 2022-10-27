name <- "Carmen";n1 <- 10; n2 <- 100; m<-0.5

#Affiche toutes les variables dans l'environnement
ls()

#Affiche les variables d'environnements dont le nom contient "m"
ls(pat = "m")

#Affiche les variables d'environnements et leur valeurs dont le nom contient "m"
ls.str(pat = "m")

#Permet de créer un vecteur?
M <- data.frame(n1, n2, m)
M

## EX3

#Permet d'effacer les variables dont le nom contient "m"
rm(list = ls(pat = "m"))

#Permet d'effacer toutes les variables de l'environnement
rm(list = ls());

## EX4

#ouvre une interface graphique simple et une interface graphique pdf   
x11(); x11(); pdf();
?x11()

#affiche la liste des peripheriques ouvert
dev.list();
dev.cur();

#Activation du device
?dev.set();
dev.set(2);  

#ferme le device spécifié
dev.off(4);
dev.list();

#ferme par défaut le current device
dev.off();
dev.list();

## EX5
?plot;





