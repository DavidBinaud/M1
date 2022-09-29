package rmi.workflow;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class DossierImpl extends UnicastRemoteObject implements Dossier {

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
}
