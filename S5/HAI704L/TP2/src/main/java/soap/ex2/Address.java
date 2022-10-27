package soap.ex2;

public class Address {

    private String number;
    private String street;
    private String city;
    private String country;

    private GPS gps;

    public Address() {
    }

    public Address(String number, String street, String city, String country, GPS gps) {
        this.number = number;
        this.street = street;
        this.city = city;
        this.country = country;
        this.gps = gps;
    }

    public String getCity() {
        return city;
    }

    @Override
    public String toString() {
        return "Address{" +
                "number='" + number + '\'' +
                ", street='" + street + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", gps=" + gps.toString() +
                '}';
    }

    public boolean checkGPS(GPS gps) {
        return this.gps.getLatitude() == gps.getLatitude() && this.gps.getLongitude() == gps.getLongitude();
    }
}
