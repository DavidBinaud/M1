package soap.ex2;

public class Client {
    private String lastName;

    private String firstName;

    private String email;

    private CreditCard creditCard;

    public Client() {
    }

    public Client(String lastName, String firstName, String email, CreditCard creditCard) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
        this.creditCard = creditCard;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public CreditCard getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCard creditCard) {
        this.creditCard = creditCard;
    }
}
