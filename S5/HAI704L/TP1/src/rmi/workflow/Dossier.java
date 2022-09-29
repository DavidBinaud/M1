package rmi.workflow;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Dossier extends Remote {
    String getContent() throws RemoteException;

    void setContent(String content) throws RemoteException;
}
