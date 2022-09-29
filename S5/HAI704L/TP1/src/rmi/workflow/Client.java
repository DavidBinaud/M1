package rmi.workflow;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Client {
	private Client() {}

	public static void main(String[] args) {

		String host = (args.length < 1) ? null : args[0];
		try {
			Registry registry = LocateRegistry.getRegistry(host);
			Animal stub = (Animal) registry.lookup("Lassie");
			String response = stub.getName();
			System.out.println("response: " + response);
			stub.printName();
			Dossier dossier = stub.getDossier();
			System.out.println("contenu du dossier: " + dossier.getContent());
			dossier.setContent("Opération 17/07");
			System.out.println("contenu du dossier: " + dossier.getContent());
		} catch (Exception e) {
			System.err.println("Client exception: " + e.toString());
			e.printStackTrace();
		}
	}
}
