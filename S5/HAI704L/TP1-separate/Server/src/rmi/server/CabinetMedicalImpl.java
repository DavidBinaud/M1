package rmi.server;

import rmi.commons.IAnimal;
import rmi.commons.IClient;
import rmi.commons.Species;
import rmi.commons.ICabinetMedical;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class CabinetMedicalImpl extends UnicastRemoteObject implements ICabinetMedical {

	private List<IAnimal> animalList;

	private List<IClient> clientList;

	private final int[] alertValues = {3, 5, 1000};

	public CabinetMedicalImpl() throws RemoteException{
		this.animalList = new ArrayList<>();
		this.clientList = new ArrayList<>();
	}


	public static void main(String args[]) {
		//Ne fonctionne pas pour une raison inconnue
		System.setProperty("java.security.policy", "file:/home/e20180001426/Bureau/M1/S5/HAI704L/TP1-separate/out/production/Server/rmi/server/rmi.policy");
		System.setProperty("java.rmi.server.codebase", "file:/home/e20180001426/Bureau/M1/S5/HAI704L/TP1-separate/out/production/Client/");
		System.setSecurityManager(new SecurityManager());
		try {
			CabinetMedicalImpl veterinaryCabinet = new CabinetMedicalImpl();
			veterinaryCabinet.addAnimal("Lassie", "Toto", new Species("Dog", 5), "Collie");
			veterinaryCabinet.addAnimal("Willy", "Tata", new Species("Whale", 75), "Blue");
			 Registry registry = LocateRegistry.createRegistry(1099);
//			Registry registry = LocateRegistry.getRegistry();
			if (registry==null){
				System.err.println("RmiRegistry not found");
			}else{
				registry.rebind("cabinet", veterinaryCabinet);
				System.err.println("Server ready");
			}
		} catch (Exception e) {
			System.err.println("Server exception: " + e.toString());
			e.printStackTrace();
		}
	}

	@Override
	public IAnimal getAnimal(String nom) throws RemoteException {
		Optional<IAnimal> animal = this.animalList.stream().filter(a -> {
			try {
				return a.getName().compareTo(nom) == 0;
			} catch (RemoteException e) {
				throw new RuntimeException(e);
			}
		}).findFirst();

		return animal.orElse(null);
	}

	@Override
	public boolean addAnimal(String name, String ownerName, Species species, String race) throws RemoteException {
		IAnimal animal = new AnimalImpl(name, ownerName, species, race);
		boolean added = this.animalList.add(animal);
		System.err.println(animalList);
		int size = this.animalList.size();
		if(added){
			if(Arrays.stream(alertValues).anyMatch(value -> value == size)){
				alertClients();
			}
			System.out.println(animal);
		}
		return added;
	}

	@Override
	public boolean addAnimal(String name, String ownerName, String specieName, int lifeExpectancy, String race) throws RemoteException {
		return addAnimal(name, ownerName, new Species(specieName, lifeExpectancy), race);
	}

	@Override
	public boolean addClient(IClient client) throws RemoteException {
		return this.clientList.add(client);
	}

	public void alertClients() throws RemoteException {
		for (IClient client: clientList) {
			client.sendAlert("La taille de " + animalList.size() + " a été atteinte");
		}
	}
}