# Java RMI

## Questions

### Question 1.

On lance le registre dans le fond avec:
```bash 
rmiregistry &
```

Pour lancer le Serveur on va éxecuter la classer Server avec la commande suivante:
```bash 
java -classpath classDir example.hello.Server &
```

On lance ensuite le client avec la commande:
```bash 
java -classpath classDir example.hello.Client &
```

### Question 2.
Au lieu de faire appel à un registre existant, on créée le registre de façon programmatique sur le port 1099.

### Question 3.
srv-out: "Server ready"

clt-out: "response: Hello world!"

srv-out: "The server prints: Hello, world!"

### Question 4.
Les objets de type HelloImpl seront créés sur la JVM du Server

### Question 5.
L'interface Hello.java sert à établir un contrat qui sera commun à l'implémentation des objets sur le Server et aux stubs sur le Client pour que le Client puisse utiliser le comportement fournit aux stubs sans en connaitre l'implémentation.

### Question 6.
RemoteException qui peut être lancée lors d'un appel à une méthode distante.
AccessException si l'accès au registre local est interdit.
AlreadyBoundException si on tente de binder une variable sur un nom de registre déjà utilisé.

### Question 7.
bind permet d'ajouter une référence dans le registre.
rebind permet de remplacer une référence dans le registre.

bind va lancer une exception si on tente d'ajouter une référence avec un nom déjà existant.

### Question 8.
la variable host sera null.
L'appel LocateRegistry.getRegistry(host) va se connecter au registre sur localhost:1099

### Question 9.
Diagramme d'objet

## Documentation
### JavaDoc
[Registry](https://docs.oracle.com/en/java/javase/18/docs/api/java.rmi/java/rmi/registry/Registry.html "JAVA Doc - Registry")
[LocateRegistry](https://docs.oracle.com/en/java/javase/18/docs/api/java.rmi/java/rmi/registry/LocateRegistry.html "JAVA Doc - LocateRegistry")
[Remote](https://docs.oracle.com/en/java/javase/18/docs/api/java.rmi/java/rmi/Remote.html "JAVA Doc - Remote")