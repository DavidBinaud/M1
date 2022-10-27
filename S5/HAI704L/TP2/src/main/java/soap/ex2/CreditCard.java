package soap.ex2;

public class CreditCard {
    private String number;
    private String type;
    private String expirationDate;
    private String ownerName;

    public CreditCard() {
    }

    public CreditCard(String number, String type, String expirationDate, String ownerName) {
        this.number = number;
        this.type = type;
        this.expirationDate = expirationDate;
        this.ownerName = ownerName;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }
}
