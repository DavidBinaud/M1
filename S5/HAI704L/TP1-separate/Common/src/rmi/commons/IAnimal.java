package rmi.commons;

import java.rmi.Remote;
import java.rmi.RemoteException;
public interface IAnimal extends Remote{
	String getName() throws RemoteException;
	void printName() throws RemoteException;

	IDossier getDossier() throws RemoteException;

	Species getSpecie() throws RemoteException;
}


