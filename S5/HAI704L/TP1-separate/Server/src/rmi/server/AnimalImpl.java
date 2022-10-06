package rmi.server;

import rmi.commons.IAnimal;
import rmi.commons.IDossier;
import rmi.commons.Species;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class AnimalImpl extends UnicastRemoteObject  implements IAnimal {

	private String name;

	private String ownerName;

	private Species species;

	private String race;

	private IDossier IDossier;

	public AnimalImpl(String name, String ownerName, Species species, String race) throws RemoteException {
		this.name = name;
		this.ownerName = ownerName;
		this.species = species;
		this.race = race;
		this.IDossier = new DossierImpl();
	}

	public AnimalImpl(String name, String ownerName, String speciesName, int lifeExpectancy , String race) throws RemoteException {
		this.name = name;
		this.ownerName = ownerName;
		this.species = new Species(speciesName, lifeExpectancy);
		this.race = race;
		this.IDossier = new DossierImpl();
	}



	@Override
	public String toString() {
		return "AnimalImpl{" +
				"name='" + name + '\'' +
				", ownerName='" + ownerName + '\'' +
				", specie=" + species +
				", race='" + race + '\'' +
				", dossier=" + IDossier +
				'}';
	}

	@Override
	public String getName() throws RemoteException {
		return name;
	}

	@Override
	public void printName() throws RemoteException {
		System.out.println(this);
	}

	@Override
	public IDossier getDossier() throws RemoteException{
		return IDossier;
	}

	public Species getSpecie() {
		return species;
	}
}
