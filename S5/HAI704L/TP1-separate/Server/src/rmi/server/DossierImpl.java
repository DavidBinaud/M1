package rmi.server;

import rmi.commons.IDossier;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class DossierImpl extends UnicastRemoteObject implements IDossier {

    private String content;

    public DossierImpl() throws RemoteException {
        this.content = "";
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "DossierImpl{" +
                "content='" + content + '\'' +
                '}';
    }
}
