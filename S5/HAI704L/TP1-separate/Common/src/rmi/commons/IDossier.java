package rmi.commons;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IDossier extends Remote {
    String getContent() throws RemoteException;

    void setContent(String content) throws RemoteException;
}
