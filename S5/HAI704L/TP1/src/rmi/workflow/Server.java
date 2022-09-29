package rmi.workflow;

import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class Server {

	public Server() {}


	public static void main(String args[]) {
		//Ne fonctionne pas pour une raison inconnue
		//System.setProperty("java.security.policy", "rmi.policy");
		//System.setSecurityManager(new SecurityManager());
		try {
			AnimalImpl animal = new AnimalImpl("Lassie", "Toto", new Specie("Dog", 5), "Collie");
			// Registry registry = LocateRegistry.createRegistry(1099);
			Registry registry = LocateRegistry.getRegistry();
			if (registry==null){
				System.err.println("RmiRegistry not found");
			}else{
				registry.bind("Lassie", animal);
				System.err.println("Server ready");
			}
		} catch (Exception e) {
			System.err.println("Server exception: " + e.toString());
			e.printStackTrace();
		}
	}
}