package rmi.commons;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IClient extends Remote {
    void sendAlert(String alert) throws RemoteException;
}
