package rmi.client;

import rmi.commons.*;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.Random;

public class Client extends UnicastRemoteObject implements IClient {

	private String[] names = {"Tata", "Toto", "Titi", "Tete", "Tyty"};
	private Client() throws RemoteException {}

	public static void main(String[] args) {
		String host = (args.length < 1) ? null : args[0];
		try {
			Registry registry = LocateRegistry.getRegistry(host);
			ICabinetMedical stubICabinetMedical = (ICabinetMedical) registry.lookup("cabinet");
			Client client = new Client();
			stubICabinetMedical.addClient(client);

			IAnimal rouky = stubICabinetMedical.getAnimal("Rouky");
			if(rouky == null){
				System.out.println("Il n'y a pas d'animal qui s'appelle Rouky");
				boolean added = stubICabinetMedical.addAnimal("Rouky", "Bland", new Dog(), "Red");
				System.out.println(added ? "Rouky was added" : "Rouky wasn't added");
				rouky = stubICabinetMedical.getAnimal("Rouky");
				System.out.println("Espece de rouky: " + rouky.getSpecie());
			}
			Random rand = new Random();
			stubICabinetMedical.addAnimal(client.names[rand.nextInt(5)], "Bobby", new Dog(), "race");
		} catch (Exception e) {
			System.err.println("rmi.client.Client exception: " + e.toString());
			e.printStackTrace();
		}
	}

	@Override
	public void sendAlert(String alert) throws RemoteException {
		System.err.println(alert);
	}
}
