package rmi.commons;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface ICabinetMedical extends Remote {

    IAnimal getAnimal(String nom) throws RemoteException;

    boolean addAnimal(String name, String ownerName, Species species, String race) throws RemoteException;

    boolean addAnimal(String name, String ownerName, String specieName, int lifeExpectancy, String race) throws RemoteException;

    boolean addClient(IClient client) throws RemoteException;
}
