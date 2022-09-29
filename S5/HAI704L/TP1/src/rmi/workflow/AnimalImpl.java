package rmi.workflow;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class AnimalImpl extends UnicastRemoteObject  implements Animal {

	private String name;

	private String ownerName;

	private Specie specie;

	private String race;

	private Dossier dossier;

	public AnimalImpl(String name, String ownerName, Specie specie, String race) throws RemoteException {
		this.name = name;
		this.ownerName = ownerName;
		this.specie = specie;
		this.race = race;
		this.dossier = new DossierImpl();
	}

	@Override
	public String getName() throws RemoteException {
		return "Animal: {name: " + name + ", ownerName: " + ownerName + "}";
	}

	@Override
	public void printName() throws RemoteException {
		System.out.println(getName());
	}

	@Override
	public Dossier getDossier() throws RemoteException{
		return dossier;
	}
}
