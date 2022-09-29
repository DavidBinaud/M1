package rmi.workflow;

import java.rmi.Remote;
import java.rmi.RemoteException;
public interface Animal extends Remote{
	String getName() throws RemoteException;
	void printName() throws RemoteException;

	Dossier getDossier() throws RemoteException;
}


